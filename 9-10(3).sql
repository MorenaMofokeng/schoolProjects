CREATE OR REPLACE PROCEDURE display_salary_grade_info(p_grade IN NUMBER) IS
    v_losal SALGRADE.LOSAL%TYPE;
    v_hisal SALGRADE.HISAL%TYPE;
BEGIN
    SELECT losal, hisal
    INTO v_losal, v_hisal
    FROM salgrade
    WHERE grade = p_grade;

    DBMS_OUTPUT.PUT_LINE('The salary grade ' || p_grade || ' ranges from R' ||
                         TO_CHAR(v_losal, '9,990.00') || ' – R' ||
                         TO_CHAR(v_hisal, '9,990.00'));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid salary grade: ' || p_grade);
        RAISE;
END;
/
===============================================================================================
CREATE OR REPLACE PROCEDURE list_employees_by_grade(p_grade IN NUMBER) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('     EMPNO  ENAME       JOB         SALARY     DEPTNO  LOC');
    DBMS_OUTPUT.PUT_LINE('----------  ----------  ---------   ----------  -------  -------------');

    FOR rec IN (
        SELECT e.empno, e.ename, e.job, e.sal, e.deptno, d.loc
        FROM emp e
        JOIN dept d ON e.deptno = d.deptno
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE s.grade = p_grade
        ORDER BY e.empno
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            LPAD(rec.empno, 10) || '  ' ||
            RPAD(rec.ename, 10) || '  ' ||
            RPAD(rec.job, 9)    || '  ' ||
            LPAD(TO_CHAR(rec.sal, '9,990.00'), 10) || '  ' ||
            LPAD(rec.deptno, 5) || '  ' ||
            RPAD(rec.loc, 10)
        );
    END LOOP;
END;
/
============================================================================================
CREATE OR REPLACE PROCEDURE list_employees_by_grade(p_grade IN NUMBER) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('     EMPNO  ENAME       JOB         SALARY     DEPTNO  LOC');
    DBMS_OUTPUT.PUT_LINE('----------  ----------  ---------   ----------  -------  -------------');

    FOR rec IN (
        SELECT e.empno, e.ename, e.job, e.sal, e.deptno, d.loc
        FROM emp e
        JOIN dept d ON e.deptno = d.deptno
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE s.grade = p_grade
        ORDER BY e.empno
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            LPAD(rec.empno, 10) || '  ' ||
            RPAD(rec.ename, 10) || '  ' ||
            RPAD(rec.job, 9)    || '  ' ||
            LPAD(TO_CHAR(rec.sal, '9,990.00'), 10) || '  ' ||
            LPAD(rec.deptno, 5) || '  ' ||
            RPAD(rec.loc, 10)
        );
    END LOOP;
END;
/
======================================================================================
CREATE OR REPLACE FUNCTION get_total_salary_by_grade(p_grade IN NUMBER)
RETURN NUMBER IS
    CURSOR sal_cur IS
        SELECT e.sal
        FROM emp e
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE s.grade = p_grade;

    v_total_salary NUMBER := 0;
    v_salary       emp.sal%TYPE;
BEGIN
    OPEN sal_cur;
    LOOP
        FETCH sal_cur INTO v_salary;
        EXIT WHEN sal_cur%NOTFOUND;
        v_total_salary := v_total_salary + v_salary;
    END LOOP;
    CLOSE sal_cur;

    RETURN v_total_salary;
END;
/
============================================================================================
SET SERVEROUTPUT ON;

DECLARE
    v_grade         NUMBER := &Enter_value_for_grade;
    v_total_salary  NUMBER;
    v_exists        NUMBER;
BEGIN
    -- Check if grade exists
    SELECT COUNT(*) INTO v_exists FROM salgrade WHERE grade = v_grade;

    IF v_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Invalid salary grade entered: ' || v_grade);
    ELSE
        -- Show salary range
        display_salary_grade_info(v_grade);

        -- List employees in the grade
        list_employees_by_grade(v_grade);

        -- Compute total salary
        v_total_salary := get_total_salary_by_grade(v_grade);
        DBMS_OUTPUT.PUT_LINE('Total salary for this grade: R' || TO_CHAR(v_total_salary, '9,990.00'));
    END IF;
END;
/
