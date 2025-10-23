--BASICLOOP
SQL> DECLARE
  2      CURSOR grade_cursor IS
  3          SELECT sg.grade,
  4                 sg.losal || '-' || sg.hisal AS salary_range,
  5                 SUM(e.sal) AS total_salary,
  6                 COUNT(e.empno) AS employee_count
  7          FROM salgrade sg
  8          LEFT JOIN emp e ON e.sal BETWEEN sg.losal AND sg.hisal
  9          GROUP BY sg.grade, sg.losal, sg.hisal
 10          ORDER BY sg.grade;
 11
 12      v_grade_rec grade_cursor%ROWTYPE;
 13  BEGIN
 14      OPEN grade_cursor;
 15
 16      DBMS_OUTPUT.PUT_LINE('Summary of Salary Grade:');
 17      DBMS_OUTPUT.PUT_LINE('GRADE       RANGE        TOTAL        NO_of_SALARY');
 18      DBMS_OUTPUT.PUT_LINE('----------  ----------  -----------  --------------');
 19
 20      LOOP
 21          FETCH grade_cursor INTO v_grade_rec;
 22          EXIT WHEN grade_cursor%NOTFOUND;
 23
 24          DBMS_OUTPUT.PUT_LINE(
 25              RPAD(v_grade_rec.grade, 10) || '  ' ||
 26              RPAD(v_grade_rec.salary_range, 10) || '  ' ||
 27              'R' || TO_CHAR(v_grade_rec.total_salary, '9,999.99') || '  ' ||
 28              LPAD(v_grade_rec.employee_count, 15)
 29          );
 30      END LOOP;
 31
 32      CLOSE grade_cursor;
 33  END;
 34  /
 ======================================================================================
 --WHILELOOP
 DECLARE
    CURSOR grade_cursor IS
        SELECT sg.grade, 
               sg.losal || '-' || sg.hisal AS salary_range,
               SUM(e.sal) AS total_salary,
               COUNT(e.empno) AS employee_count
        FROM salgrade sg
        LEFT JOIN emp e ON e.sal BETWEEN sg.losal AND sg.hisal
        GROUP BY sg.grade, sg.losal, sg.hisal
        ORDER BY sg.grade;
    
    v_grade_rec grade_cursor%ROWTYPE;
    v_more_data BOOLEAN := TRUE;
BEGIN
    OPEN grade_cursor;
    
    DBMS_OUTPUT.PUT_LINE('Summary of Salary Grade:');
    DBMS_OUTPUT.PUT_LINE('GRADE       RANGE        TOTAL        NO_of_SALARY');
    DBMS_OUTPUT.PUT_LINE('----------  ----------  -----------  --------------');
    
    WHILE v_more_data LOOP
        FETCH grade_cursor INTO v_grade_rec;
        v_more_data := grade_cursor%FOUND;
        
        IF v_more_data THEN
            DBMS_OUTPUT.PUT_LINE(
                RPAD(v_grade_rec.grade, 10) || '  ' ||
                RPAD(v_grade_rec.salary_range, 10) || '  ' ||
                'R' || TO_CHAR(v_grade_rec.total_salary, '9,999.99') || '  ' ||
                LPAD(v_grade_rec.employee_count, 15)
            );
        END IF;
    END LOOP;
    
    CLOSE grade_cursor;
END;
/
==============================================================================================
--CURSOR-FOR
BEGIN
    DBMS_OUTPUT.PUT_LINE('Summary of Salary Grade:');
    DBMS_OUTPUT.PUT_LINE('GRADE       RANGE        TOTAL        NO_of_SALARY');
    DBMS_OUTPUT.PUT_LINE('----------  ----------  -----------  --------------');
    
    FOR grade_rec IN (
        SELECT sg.grade, 
               sg.losal || '-' || sg.hisal AS salary_range,
               SUM(e.sal) AS total_salary,
               COUNT(e.empno) AS employee_count
        FROM salgrade sg
        LEFT JOIN emp e ON e.sal BETWEEN sg.losal AND sg.hisal
        GROUP BY sg.grade, sg.losal, sg.hisal
        ORDER BY sg.grade
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(grade_rec.grade, 10) || '  ' ||
            RPAD(grade_rec.salary_range, 10) || '  ' ||
            'R' || TO_CHAR(grade_rec.total_salary, '9,999.99') || '  ' ||
            LPAD(grade_rec.employee_count, 15)
        );
    END LOOP;
END;
/
======================================================================================================
--2WHILE
DECLARE
    CURSOR dept_emp_cursor(p_deptno NUMBER) IS
        SELECT e.empno, e.ename, e.job, e.sal, m.ename AS mgr_name
        FROM emp e
        LEFT JOIN emp m ON e.mgr = m.empno
        WHERE e.deptno = p_deptno
        ORDER BY e.empno;
    
    v_emp_record dept_emp_cursor%ROWTYPE;
    v_deptno emp.deptno%TYPE;
    v_dname dept.dname%TYPE;
    v_loc dept.loc%TYPE;
    v_emp_count NUMBER := 0;
    v_total_sal NUMBER := 0;
    v_input_empno emp.empno%TYPE := &employee_number;
    v_cursor_open BOOLEAN := FALSE;
BEGIN
    -- Get department info for the input employee
    SELECT e.deptno, d.dname, d.loc
    INTO v_deptno, v_dname, v_loc
    FROM emp e
    JOIN dept d ON e.deptno = d.deptno
    WHERE e.empno = v_input_empno;
    
    -- Display department header
    DBMS_OUTPUT.PUT_LINE(v_deptno || '-' || v_dname || '(' || v_loc || ')');
    DBMS_OUTPUT.PUT_LINE('The following staffs work with the employee in the same department:');
    DBMS_OUTPUT.PUT_LINE('S/No. EMPLOYEE       JOB        SAL MANAGER');
    DBMS_OUTPUT.PUT_LINE('----- --------------- ---------- ---------- ----------');
    
    -- Open cursor if not already open
    IF NOT v_cursor_open THEN
        OPEN dept_emp_cursor(v_deptno);
        v_cursor_open := TRUE;
    END IF;
    
    -- Process records with WHILE loop
    WHILE v_cursor_open LOOP
        FETCH dept_emp_cursor INTO v_emp_record;
        EXIT WHEN dept_emp_cursor%NOTFOUND;
        
        v_emp_count := v_emp_count + 1;
        v_total_sal := v_total_sal + v_emp_record.sal;
        
        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_emp_count || '.', 6) ||
            RPAD(v_emp_record.empno || '-' || v_emp_record.ename, 16) ||
            RPAD(v_emp_record.job, 10) ||
            RPAD(v_emp_record.sal, 10) ||
            NVL(v_emp_record.mgr_name, 'NULL')
        );
    END LOOP;
    
    -- Close cursor if it was opened
    IF v_cursor_open THEN
        CLOSE dept_emp_cursor;
        v_cursor_open := FALSE;
    END IF;
    
    -- Display summary
    DBMS_OUTPUT.PUT_LINE('No. of staff: ' || v_emp_count);
    DBMS_OUTPUT.PUT_LINE('Total salary: R' || TO_CHAR(v_total_sal, '99,999.00'));
END;
/
=============================================================================================
--CURSORFOR
DECLARE
    v_deptno emp.deptno%TYPE;
    v_dname dept.dname%TYPE;
    v_loc dept.loc%TYPE;
    v_emp_count NUMBER := 0;
    v_total_sal NUMBER := 0;
    v_input_empno emp.empno%TYPE := &employee_number;
BEGIN
    -- Get department info for the input employee
    SELECT e.deptno, d.dname, d.loc
    INTO v_deptno, v_dname, v_loc
    FROM emp e
    JOIN dept d ON e.deptno = d.deptno
    WHERE e.empno = v_input_empno;
    
    -- Display department header
    DBMS_OUTPUT.PUT_LINE(v_deptno || '-' || v_dname || '(' || v_loc || ')');
    DBMS_OUTPUT.PUT_LINE('The following staffs work with the employee in the same department:');
    DBMS_OUTPUT.PUT_LINE('S/No. EMPLOYEE       JOB        SAL MANAGER');
    DBMS_OUTPUT.PUT_LINE('----- --------------- ---------- ---------- ----------');
    
    -- Process records with CURSOR-FOR loop
    FOR emp_rec IN (
        SELECT e.empno, e.ename, e.job, e.sal, m.ename AS mgr_name
        FROM emp e
        LEFT JOIN emp m ON e.mgr = m.empno
        WHERE e.deptno = v_deptno
        ORDER BY e.empno
    ) LOOP
        v_emp_count := v_emp_count + 1;
        v_total_sal := v_total_sal + emp_rec.sal;
        
        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_emp_count || '.', 6) ||
            RPAD(emp_rec.empno || '-' || emp_rec.ename, 16) ||
            RPAD(emp_rec.job, 10) ||
            RPAD(emp_rec.sal, 10) ||
            NVL(emp_rec.mgr_name, 'NULL')
        );
    END LOOP;
    
    -- Display summary
    DBMS_OUTPUT.PUT_LINE('No. of staff: ' || v_emp_count);
    DBMS_OUTPUT.PUT_LINE('Total salary: R' || TO_CHAR(v_total_sal, '99,999.00'));
END;
/
============================================================================================
DECLARE
    -- Cursor with parameters
    CURSOR emp_cursor(p_deptno NUMBER, p_job VARCHAR2) IS
        SELECT empno, 
               ename, 
               job, 
               sal + NVL(comm, 0) AS total,
               comm,
               hiredate,
               FLOOR(MONTHS_BETWEEN(SYSDATE, hiredate)/12) AS years
        FROM emp
        WHERE deptno = p_deptno
        AND UPPER(job) LIKE UPPER(p_job)
        ORDER BY empno;
    
    -- Record variable
    v_emp_rec emp_cursor%ROWTYPE;
    v_more_data BOOLEAN := TRUE;
    
    -- Input variables
    v_deptno NUMBER := &department_no;
    v_job VARCHAR2(20) := '&job_desc';
BEGIN
    -- Open cursor with parameters
    OPEN emp_cursor(v_deptno, v_job);
    
    -- Display report header
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE               TOTAL    Comm(Y/N) HIREDATE    YEARS');
    DBMS_OUTPUT.PUT_LINE('---------------------- ---------- ---------- ----------- ----------');
    
    -- Process records with WHILE loop
    WHILE v_more_data LOOP
        FETCH emp_cursor INTO v_emp_rec;
        v_more_data := emp_cursor%FOUND;
        
        IF v_more_data THEN
            DBMS_OUTPUT.PUT_LINE(
                RPAD(v_emp_rec.empno || '-' || v_emp_rec.ename || '(' || v_emp_rec.job || ')', 22) ||
                TO_CHAR(v_emp_rec.total, '9,999.99') || '  ' ||
                CASE WHEN v_emp_rec.comm IS NOT NULL THEN 'Yes' ELSE 'No ' END || '  ' ||
                TO_CHAR(v_emp_rec.hiredate, 'DD-Mon-YYYY') || '  ' ||
                LPAD(v_emp_rec.years, 2)
            );
        END IF;
    END LOOP;
    
    -- Close cursor
    CLOSE emp_cursor;
    
    -- Display summary
    DBMS_OUTPUT.PUT_LINE('Number of employees: ' || emp_cursor%ROWCOUNT);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        IF emp_cursor%ISOPEN THEN
            CLOSE emp_cursor;
        END IF;
END;
/
===================================================================================================
DECLARE
    -- Cursor with parameters
    CURSOR emp_cursor(p_deptno NUMBER, p_job VARCHAR2) IS
        SELECT empno, 
               ename, 
               job, 
               sal + NVL(comm, 0) AS total,
               comm,
               hiredate,
               FLOOR(MONTHS_BETWEEN(SYSDATE, hiredate)/12) AS years
        FROM emp
        WHERE deptno = p_deptno
        AND UPPER(job) LIKE UPPER(p_job)
        ORDER BY empno;
    
    -- Record variable
    v_emp_rec emp_cursor%ROWTYPE;
    
    -- Input variables
    v_deptno NUMBER := &department_no;
    v_job VARCHAR2(20) := '&job_desc';
BEGIN
    -- Open cursor with parameters
    OPEN emp_cursor(v_deptno, v_job);
    
    -- Display report header
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE               TOTAL    Comm(Y/N) HIREDATE    YEARS');
    DBMS_OUTPUT.PUT_LINE('---------------------- ---------- ---------- ----------- ----------');
    
    -- Process records with BASIC loop
    LOOP
        FETCH emp_cursor INTO v_emp_rec;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_emp_rec.empno || '-' || v_emp_rec.ename || '(' || v_emp_rec.job || ')', 22) ||
            TO_CHAR(v_emp_rec.total, '9,999.99') || '  ' ||
            CASE WHEN v_emp_rec.comm IS NOT NULL THEN 'Yes' ELSE 'No ' END || '  ' ||
            TO_CHAR(v_emp_rec.hiredate, 'DD-Mon-YYYY') || '  ' ||
            LPAD(v_emp_rec.years, 2)
        );
    END LOOP;
    
    -- Close cursor
    CLOSE emp_cursor;
    
    -- Display summary
    DBMS_OUTPUT.PUT_LINE('Number of employees: ' || emp_cursor%ROWCOUNT);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        IF emp_cursor%ISOPEN THEN
            CLOSE emp_cursor;
        END IF;
END;
/
======================================================================================
