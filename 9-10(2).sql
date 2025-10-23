CREATE OR REPLACE PROCEDURE job_summary_analysis(p_job IN VARCHAR2) IS
    v_count  NUMBER;
    v_avg    NUMBER(10, 2);
    v_min    NUMBER(10, 2);
    v_max    NUMBER(10, 2);
BEGIN
    SELECT COUNT(*), AVG(sal), MIN(sal), MAX(sal)
    INTO v_count, v_avg, v_min, v_max
    FROM emp
    WHERE UPPER(job) = UPPER(p_job);

    DBMS_OUTPUT.PUT_LINE('Job summary and analysis:');
    DBMS_OUTPUT.PUT_LINE('No. of employees: ' || v_count);
    DBMS_OUTPUT.PUT_LINE('Average salary: R' || TO_CHAR(v_avg, '9990.00'));
    DBMS_OUTPUT.PUT_LINE('Minimum salary: R' || TO_CHAR(v_min, '9990.00'));
    DBMS_OUTPUT.PUT_LINE('Maximum salary: R' || TO_CHAR(v_max, '9990.00'));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for job: ' || p_job);
END;
/

====================================================================================
CREATE OR REPLACE PROCEDURE job_employees_details(p_job IN VARCHAR2) IS
    CURSOR emp_cur IS
        SELECT e.empno, e.ename, e.sal, e.hiredate, d.deptno, d.dname,
               (SELECT ename FROM emp m WHERE m.empno = e.mgr) AS manager
        FROM emp e
        JOIN dept d ON e.deptno = d.deptno
        WHERE UPPER(e.job) = UPPER(p_job)
        ORDER BY e.empno;

    v_count NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('The following staffs are working as ' || INITCAP(p_job) || ':');
    DBMS_OUTPUT.PUT_LINE('S/No.  EMPLOYEE           SALARY    HIREDATE    DEPARTMENT         MANAGER');
    DBMS_OUTPUT.PUT_LINE('-----  ----------------  --------- ----------  -----------------  ----------');

    FOR emp_rec IN emp_cur LOOP
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE(
            LPAD(v_count, 3) || '.  ' ||
            RPAD(emp_rec.empno || '-' || emp_rec.ename, 18) ||
            LPAD(TO_CHAR(emp_rec.sal, '9990.00'), 10) || '  ' ||
            TO_CHAR(emp_rec.hiredate, 'DD/MON/YY') || '  ' ||
            RPAD(emp_rec.deptno || '-' || emp_rec.dname, 18) || '  ' ||
            NVL(emp_rec.manager, 'N/A')
        );
    END LOOP;
END;
/
==========================================================================================
CREATE OR REPLACE FUNCTION get_total_job_salary(p_job IN VARCHAR2) RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT SUM(sal + NVL(comm, 0)) INTO v_total
    FROM emp
    WHERE UPPER(job) = UPPER(p_job);

    RETURN NVL(v_total, 0);
END;
/
==============================================================================================
SET SERVEROUTPUT ON;

DECLARE
    v_job       VARCHAR2(20) := '&Enter_job_description';
    v_total     NUMBER;
    v_count     NUMBER := 1;
    v_max       NUMBER;
    CURSOR emp_cur IS
        SELECT empno, ename, sal, TO_CHAR(hiredate, 'DD/MON/YY') AS hiredate,
               deptno, (SELECT dname FROM dept WHERE deptno = e.deptno) AS dname,
               (SELECT ename FROM emp m WHERE m.empno = e.mgr) AS manager
        FROM emp e
        WHERE UPPER(job) = UPPER(v_job)
        ORDER BY empno;

    TYPE emp_tab_type IS TABLE OF emp_cur%ROWTYPE INDEX BY PLS_INTEGER;
    emp_tab emp_tab_type;
BEGIN
    -- Call summary procedure
    job_summary_analysis(v_job);

    -- Fetch employee details into collection
    OPEN emp_cur;
    FETCH emp_cur BULK COLLECT INTO emp_tab;
    v_max := emp_tab.COUNT;
    CLOSE emp_cur;

    -- Print table headers
    DBMS_OUTPUT.PUT_LINE('The following staffs are working as ' || INITCAP(v_job) || ':');
    DBMS_OUTPUT.PUT_LINE('S/No.  EMPLOYEE         SALARY    HIREDATE   DEPARTMENT         MANAGER');
    DBMS_OUTPUT.PUT_LINE('-----  ---------------  --------  ---------  ---------------    ----------');

    -- WHILE loop to print rows
    WHILE v_count <= v_max LOOP
        DBMS_OUTPUT.PUT_LINE(
            LPAD(v_count, 2) || '. ' ||
            RPAD(emp_tab(v_count).empno || '-' || emp_tab(v_count).ename, 17) || '  ' ||
            LPAD(TO_CHAR(emp_tab(v_count).sal, '9990.00'), 8) || '  ' ||
            RPAD(emp_tab(v_count).hiredate, 10) || '  ' ||
            RPAD(emp_tab(v_count).deptno || '-' || emp_tab(v_count).dname, 17) || '  ' ||
            NVL(emp_tab(v_count).manager, 'N/A')
        );
        v_count := v_count + 1;
    END LOOP;

    -- Total salary
    v_total := get_total_job_salary(v_job);
    DBMS_OUTPUT.PUT_LINE('Total ' || INITCAP(v_job) || ' salary: R' || TO_CHAR(v_total, '9990.00'));
END;
/
