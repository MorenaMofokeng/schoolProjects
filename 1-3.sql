--1
DECLARE
    v_staff_no STAFF.STAFF_NO%TYPE;
    v_name STAFF.NAME%TYPE;
    v_job STAFF.JOB%TYPE;
    v_department STAFF.DEPARTMENT%TYPE;
    v_location STAFF.LOCATION%TYPE;
    v_salary STAFF.SALARY%TYPE;
    v_grade STAFF.GRADE%TYPE;
    v_annual_salary NUMBER;
    v_salary_adjustment NUMBER;
BEGIN
    -- Prompt user for input
    v_staff_no := '&Enter_Staff_No';

    -- Retrieve staff details
    SELECT NAME, JOB, DEPARTMENT, LOCATION, SALARY, GRADE
    INTO v_name, v_job, v_department, v_location, v_salary, v_grade
    FROM STAFF
    WHERE STAFF_NO = TO_NUMBER(v_staff_no);

    -- Calculate annual salary and 25% increase
    v_annual_salary := v_salary * 12;
    v_salary_adjustment := v_annual_salary * 1.25;

    -- Display output
    DBMS_OUTPUT.PUT_LINE('Staff_No: ' || v_staff_no);
    DBMS_OUTPUT.PUT_LINE(v_name || ' (' || v_job || ') works in ' || v_department || '/' || v_location || 
                          ' earning R' || TO_CHAR(v_salary, '999,999.99') || ' on grade ' || TO_CHAR(v_grade));
    DBMS_OUTPUT.PUT_LINE('Annual salary: R' || TO_CHAR(v_annual_salary, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('25% Salary Adjustment: R' || TO_CHAR(v_salary_adjustment, '999,999.99'));

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No staff found with Staff_No ' || v_staff_no);
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid input. Please enter a valid numeric staff number.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

==========================================================================================================================================================
SQL> DECLARE
  2     v_staff_no EMP.MGR%TYPE;
  3     v_name EMP.ENAME%TYPE;
  4     v_job EMP.JOB%TYPE;
  5     v_department DEPT.DNAME%TYPE;
  6     v_location DEPT.LOC%TYPE;
  7     v_salary EMP.SAL%TYPE;
  8     v_grade SALGRADE.GRADE%TYPE;
  9     v_annual_salary NUMBER(10,2);
 10     v_salary_adjustment NUMBER(10,2);
 11  BEGIN
 12     v_staff_no := '&Enter_Staff_No';
 13     SELECT e.ENAME, e.JOB, d.DNAME, d.LOC, e.SAL, s.GRADE
 14     INTO v_name, v_job, v_department, v_location, v_salary, v_grade
 15     FROM EMP e
 16     JOIN DEPT d ON e.DEPTNO = d.DEPTNO
 17     JOIN SALGRADE s ON e.SAL BETWEEN s.LOSAL AND s.HISAL
 18     WHERE e.EMPNO = TO_NUMBER(v_staff_no);
 19
 20     v_annual_salary := v_salary * 12;
 21     v_salary_adjustment := v_annual_salary * 1.25;
 22
 23     DBMS_OUTPUT.PUT_LINE('Staff_No: '|| v_staff_no);
 24     DBMS_OUTPUT.PUT_LINE(v_name || ' (' || v_job || ') works in ' || v_department || '/' || v_location || ' earning R' || TO_CHAR(v_salary, '999,999.99'));
 25     DBMS_OUTPUT.PUT_LINE('Annual Salary: R' || TO_CHAR(v_annual_salary,'999,999.00'));
 26     DBMS_OUTPUT.PUT_LINE('25% Salary Adjustment: R' || TO_CHAR(v_salary_adjustment,'999,999.99'));
 27  EXCEPTION
 28     WHEN NO_DATA_FOUND THEN
 29             DBMS_OUTPUT.PUT_LINE('ERROR: No Staff Found with Staff_No ' || v_staff_no);
 30     WHEN VALUE_ERROR THEN
 31             DBMS_OUTPUT.PUT_LINE('Error: Invalid input. Please enter a valid numeric staff number.');
 32     WHEN OTHERS THEN
 33             DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
 34  END;
 ====================================================================================================================
 --2
 DECLARE
    v_length NUMBER;
    v_width NUMBER;
    v_area NUMBER;
    v_carpet_price CONSTANT NUMBER := 12.58;
    v_vat_rate CONSTANT NUMBER := 0.15;
    v_carpet_cost NUMBER;
    v_vat_amount NUMBER;
    v_total_cost NUMBER;
BEGIN
    -- Prompt user for input
    v_length := &Enter_value_for_length;
    v_width := &Enter_value_for_width;

    -- Calculate area
    v_area := v_length * v_width;
    
    -- Calculate cost of carpet
    v_carpet_cost := v_area * v_carpet_price;
    
    -- Calculate VAT
    v_vat_amount := v_carpet_cost * v_vat_rate;
    
    -- Calculate total amount payable
    v_total_cost := v_carpet_cost + v_vat_amount;
    
    -- Display output
    DBMS_OUTPUT.PUT_LINE('Enter value for length: ' || TO_CHAR(v_length, '9999.99'));
    DBMS_OUTPUT.PUT_LINE('Enter value for width: ' || TO_CHAR(v_width, '9999.99'));
    DBMS_OUTPUT.PUT_LINE('The Area is: R' || TO_CHAR(v_area, '99999.99'));
    DBMS_OUTPUT.PUT_LINE('The cost of the carpet is: R' || TO_CHAR(v_carpet_cost, '99999.99'));
    DBMS_OUTPUT.PUT_LINE('VAT @15% is: R' || TO_CHAR(v_vat_amount, '9999.99'));
    DBMS_OUTPUT.PUT_LINE('Amount Payable is: R' || TO_CHAR(v_total_cost, '99999.99'));
END;

======================================================================================
	DECLARE
		v_length NUMBER(10,2);
		v_width NUMBER(10,2);
      	v_area NUMBER(10,2);
		v_carpet_price CONSTANT NUMBER := 12.28;
		v_vat_rate CONSTANT NUMBER := 0.15;
		v_carpet_cost NUMBER(10,2);
		v_vat_amount NUMBER(10,2);
		v_total_cost NUMBER(10,2);
	BEGIN
		v_length := &length;
		v_width := &width;
		v_area := v_length * v_width;
		v_carpet_cost := v_area * v_carpet_price;
		v_vat_amount := v_carpet_cost * v_vat_rate;
		v_total_cost := v_carpet_cost + v_vat_amount;
		DBMS_OUTPUT.PUT_LINE('The Area is: R' || TO_CHAR(v_area,'999,999.99'));
		DBMS_OUTPUT.PUT_LINE('The cost of the carpet is: R' || TO_CHAR(v_carpet_cost,'999,999.99'));
		DBMS_OUTPUT.PUT_LINE('VAT @15% is: R' || TO_CHAR(v_vat_amount,'999,999.99'));
		DBMS_OUTPUT.PUT_LINE('Amount Payable is: R' || TO_CHAR(v_total_cost,'999,999.99'));
	 END;
	 /
==================================================================================================
--3
DECLARE
    -- Constant declaration for PI
    PI CONSTANT NUMBER(5,2) := 22/7;  -- More accurate than 22.3
    -- PI CONSTANT NUMBER(5,2) := 22.3;  -- As specified in your requirement
    
    -- Variables
    radius NUMBER;
    diameter NUMBER;
    circumference NUMBER;
    area NUMBER;
BEGIN
    -- Prompt user for radius (in SQL*Plus or SQL Developer)
    radius := &Enter_Radius;
    
    -- Calculate measurements
    diameter := 2 * radius;
    circumference := 2 * PI * radius;
    area := PI * POWER(radius, 2);
    
    -- Display results with descriptions
    DBMS_OUTPUT.PUT_LINE('CIRCLE MEASUREMENTS CALCULATION');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Input Radius: ' || TO_CHAR(radius, '999.99') || ' units');
    DBMS_OUTPUT.PUT_LINE('Diameter: ' || TO_CHAR(diameter, '999.99') || ' units (2 × r)');
    DBMS_OUTPUT.PUT_LINE('Circumference: ' || TO_CHAR(circumference, '9999.99') || ' units (2πr)');
    DBMS_OUTPUT.PUT_LINE('Area: ' || TO_CHAR(area, '99999.99') || ' square units (πr²)');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Note: π (pi) value used: ' || PI);
END;
/
 
 
