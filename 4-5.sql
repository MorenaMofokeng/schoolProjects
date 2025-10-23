SQL> DECLARE
  2     v_name VARCHAR2(50) := '&Name';
  3     v_age NUMBER := &Age;
  4     v_test1_mark NUMBER(10,2) := &Test_1;
  5     v_test2_mark NUMBER(10,2) := &Test_2;
  6     v_test_average NUMBER;
  7     v_total_average NUMBER;
  8     v_message VARCHAR2(100);
  9  BEGIN
 10
 11     v_test_average := (v_test1_mark + v_test2_mark)/2;
 12     IF v_age >= 40 THEN
 13             v_total_average := v_test_average + 5;
 14     ELSIF v_age < 40 THEN
 15             v_total_average := v_test_average + 2;
 16     ELSE
 17             v_total_average := v_test_average;
 18     END IF;
 19     IF v_total_average >= 75.0 THEN
 20             v_message := 'Congradulations! Your application was Successful, You are Hired.';
 21     ELSE
 22             v_message := 'Sorry! Your application was unsuccessful, You do not meet the requirements';
 23     END IF;
 24     DBMS_OUTPUT.PUT_LINE('Test Average: ' || TO_CHAR(v_test_average,'999.99'));
 25     DBMS_OUTPUT.PUT_LINE('Total Average: ' || TO_CHAR(v_total_average,'999.99'));
 26     DBMS_OUTPUT.PUT_LINE(v_message);
 27  END;
 28
 29  /
 ===========================================================================================================
 --2
 DECLARE
    v_empno EMP.EMPNO%TYPE := &Enter_Employee_Number;
    v_ename EMP.ENAME%TYPE;
    v_job EMP.JOB%TYPE;
    v_hiredate EMP.HIREDATE%TYPE;
    v_sal EMP.SAL%TYPE;
    v_annual_sal NUMBER(10,2);
    v_message VARCHAR2(100);
    v_name_check NUMBER;

BEGIN
    -- Fetch employee details
    SELECT ENAME, JOB, HIREDATE, SAL 
    INTO v_ename, v_job, v_hiredate, v_sal
    FROM EMP
    WHERE EMPNO = v_empno;

    -- Calculate annual salary
    v_annual_sal := v_sal * 12;

    -- Check if name contains "AR"
    v_name_check := INSTR(UPPER(v_ename), 'AR');
	
    -- Determine the appropriate message
    IF v_annual_sal < 18000 THEN
        v_message := 'Staff earn less';
    ELSIF v_name_check > 0 THEN  -- Corrected usage of INSTR
        v_message := 'Either Martin or Clarke';
    ELSIF TO_CHAR(v_hiredate, 'YYYY') = '1980' THEN
        v_message := 'Foundation member';
    ELSE
        v_message := 'Criteria do not exist';
    END IF;

    -- Display results
    DBMS_OUTPUT.PUT_LINE('Employee Number: ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('Job Title: ' || v_job);
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(v_hiredate, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Annual Salary: R' || TO_CHAR(v_annual_sal, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Message: ' || v_message);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No employee found with Employee Number ' || v_empno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
=====================================================================================================
--3 (CASE) 
DECLARE
    v_hours_worked NUMBER(5,2) := &Enter_Hours_Worked;
    v_hourly_rate NUMBER(6,2) := &Enter_Hourly_Rate;
    v_regular_hours NUMBER(5,2);
    v_overtime_hours NUMBER(5,2);
    v_double_hours NUMBER(5,2);
    v_gross_salary NUMBER(10,2);
    v_tax NUMBER(10,2);
    v_net_salary NUMBER(10,2);
    v_pay_category VARCHAR2(20);

BEGIN
    -- Determine Hours Distribution
    v_regular_hours := LEAST(v_hours_worked, 40);
    v_overtime_hours := LEAST(GREATEST(v_hours_worked - 40, 0), 10); -- Hours between 40 and 50
    v_double_hours := GREATEST(v_hours_worked - 50, 0); -- Hours above 50

    -- Calculate Gross Salary
    v_gross_salary := (v_regular_hours * v_hourly_rate) +
                      (v_overtime_hours * v_hourly_rate * 1.5) +
                      (v_double_hours * v_hourly_rate * 2);

    -- Calculate Tax (15%)
    v_tax := v_gross_salary * 0.15;

    -- Calculate Net Salary
    v_net_salary := v_gross_salary - v_tax;

    -- Determine Pay Category Using CASE
    v_pay_category := CASE 
        WHEN v_hours_worked <= 40 THEN 'Regular Pay'
        WHEN v_hours_worked BETWEEN 41 AND 50 THEN 'Overtime Pay'
        WHEN v_hours_worked > 50 THEN 'Double Pay'
        ELSE 'Invalid Hours'
    END;

    -- Display Output
    DBMS_OUTPUT.PUT_LINE('Hours Worked: ' || v_hours_worked);
    DBMS_OUTPUT.PUT_LINE('Hourly Rate: R' || TO_CHAR(v_hourly_rate, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Gross Salary: R' || TO_CHAR(v_gross_salary, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Tax (15%): R' || TO_CHAR(v_tax, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Net Salary: R' || TO_CHAR(v_net_salary, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Pay Type: ' || v_pay_category);

EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid input. Please enter numeric values.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
==================================================================================================
--7 (RECORD)
DECLARE
    -- Define a record type to store salary grade information
    TYPE SalaryGradeRec IS RECORD (
        min_salary NUMBER,
        max_salary NUMBER,
        total_salary NUMBER,
        emp_count NUMBER
    );

    -- Declare a variable of the record type
    v_salary_grade SalaryGradeRec;

    -- Variable to hold user input
    v_grade NUMBER;

BEGIN
    -- Prompt the user to enter the salary grade
    v_grade := &Enter_Salary_Grade;

    -- Retrieve salary details based on the input grade
    SELECT MIN(salary), MAX(salary), NVL(SUM(salary), 0), COUNT(*)
    INTO v_salary_grade
    FROM employees
    WHERE grade = v_grade;

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Grade ' || v_grade || ' salary is between R' 
                         || TO_CHAR(v_salary_grade.min_salary, '999,990.00') || 
                         ' and R' || TO_CHAR(v_salary_grade.max_salary, '999,990.00') ||
                         ' with total salary for ' || v_salary_grade.emp_count || 
                         ' employee(s) in this grade as R' ||
                         TO_CHAR(v_salary_grade.total_salary, '999,990.00'));
                         
EXCEPTION
    -- Handle errors
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found for salary grade ' || v_grade);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
========================================================================================
--8
DECLARE
    v_num NUMBER;         -- Input number
    v_count NUMBER := 1;  -- To count the length of the sequence

BEGIN
    -- Prompt the user to enter a number greater than 1
    v_num := &Enter_Integer;

    -- Validate the input
    IF v_num <= 1 THEN
        DBMS_OUTPUT.PUT_LINE('Please enter an integer greater than 1.');
        RETURN;
    END IF;

    -- Print the starting message
    DBMS_OUTPUT.PUT_LINE('Ulam sequence of ' || v_num);
    
    -- Print the sequence
    WHILE v_num != 1 LOOP
        DBMS_OUTPUT.PUT(v_num || CHR(9)); -- CHR(9) is a tab space for formatting

        -- Apply Ulam's rules
        IF MOD(v_num, 2) = 0 THEN
            v_num := v_num / 2; -- If even, divide by 2
        ELSE
            v_num := (v_num * 3) + 1; -- If odd, multiply by 3 and add 1
        END IF;

        v_count := v_count + 1; -- Increase count
    END LOOP;

    -- Print the final number (1)
    DBMS_OUTPUT.PUT_LINE('1');

    -- Print the total length of the sequence
    DBMS_OUTPUT.PUT_LINE('The length was ' || v_count);

END;
/
