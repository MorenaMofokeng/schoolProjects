CREATE OR REPLACE PROCEDURE show_dept_info(p_deptno IN NUMBER) IS
    v_dname DEPT.DNAME%TYPE;
    v_loc   DEPT.LOC%TYPE;
BEGIN
    SELECT dname, loc
    INTO v_dname, v_loc
    FROM dept
    WHERE deptno = p_deptno;

    DBMS_OUTPUT.PUT_LINE('Department Information:');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Department ' || p_deptno || ' (' || v_dname || ') is in ' || v_loc);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No department found with number ' || p_deptno);
END;
/
===============================================================================
CREATE OR REPLACE FUNCTION get_emp_count(p_deptno IN NUMBER) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM emp
    WHERE deptno = p_deptno;

    RETURN v_count;
END;
/
==================================================================================
CREATE OR REPLACE FUNCTION get_total_salary(p_deptno IN NUMBER) RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT SUM(sal + NVL(comm, 0)) INTO v_total
    FROM emp
    WHERE deptno = p_deptno;

    RETURN NVL(v_total, 0);
END;
/
============================================================================================================
SET SERVEROUTPUT ON;

DECLARE
    v_deptno        NUMBER := &Enter_Department_Number;
    v_emp_count     NUMBER;
    v_total_salary  NUMBER;
BEGIN
    -- Call the procedure
    show_dept_info(v_deptno);

    -- Call the functions
    v_emp_count := get_emp_count(v_deptno);
    v_total_salary := get_total_salary(v_deptno);

    -- Display results
    DBMS_OUTPUT.PUT_LINE('No of employee(s): ' || v_emp_count);
    DBMS_OUTPUT.PUT_LINE('Total Salary: R' || v_total_salary);
END;
/
