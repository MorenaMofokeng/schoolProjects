SET SERVEROUTPUT ON;

DECLARE
    v_sum_squares NUMBER := 0;
    v_sum_cubes NUMBER := 0;
    v_count_cubes_gt_500 NUMBER := 0;
    v_num NUMBER := 1;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('NUMBER    SQUARE    CUBE');
    DBMS_OUTPUT.PUT_LINE('-------------------------');

    LOOP
        DECLARE
            v_square NUMBER := v_num * v_num;
            v_cube NUMBER := v_num * v_num * v_num;
        BEGIN
            -- Display table
            DBMS_OUTPUT.PUT_LINE(v_num || CHR(9) || v_square || CHR(9) || v_cube);
            
            -- Compute sum of squares & cubes
            v_sum_squares := v_sum_squares + v_square;
            v_sum_cubes := v_sum_cubes + v_cube;
            
            -- Count cubes greater than 500
            IF v_cube > 500 THEN
                v_count_cubes_gt_500 := v_count_cubes_gt_500 + 1;
            END IF;
            
            -- Increment counter
            v_num := v_num + 1;
            
            -- Exit condition
            EXIT WHEN v_num > 15;
        END;
    END LOOP;

    -- Display results
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    DBMS_OUTPUT.PUT_LINE('Sum of Squares: ' || v_sum_squares);
    DBMS_OUTPUT.PUT_LINE('Sum of Cubes: ' || v_sum_cubes);
    DBMS_OUTPUT.PUT_LINE('Count of Cubes > 500: ' || v_count_cubes_gt_500);

    -- Check if sum of squares exceeds 2000
    IF v_sum_squares > 2000 THEN
        DBMS_OUTPUT.PUT_LINE('The sum of squares exceeds 2,000.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The sum of squares does NOT exceed 2,000.');
    END IF;
END;
/
