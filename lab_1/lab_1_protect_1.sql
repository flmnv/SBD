DECLARE
    loop_comm NUMBER(7,2) := .15;
    row_count NUMBER(1,0);

BEGIN
    LOOP
        SELECT COUNT(COMM) INTO row_count
        FROM SAL
        WHERE COMM = loop_comm;

        EXIT WHEN row_count = 0;
        
        loop_comm := loop_comm - .01;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(loop_comm);
END;