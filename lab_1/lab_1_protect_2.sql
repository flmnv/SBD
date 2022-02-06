DECLARE
    cnum_exception EXCEPTION;
    cname_char VARCHAR2(10);
    for_count NUMBER(1,0);

BEGIN
    FOR row_data IN (
        SELECT DISTINCT(CNUM)
        FROM ORD)
    LOOP
        SELECT COUNT(*) INTO for_count
        FROM ORD
        WHERE ODATE < TO_DATE('2010-01-05', 'YYYY-MM-DD')
        AND CNUM = row_data.cnum;

        IF for_count = 0 THEN
            SELECT CNAME INTO cname_char
            FROM CUST
            WHERE CNUM = row_data.cnum;

            RAISE cnum_exception;
        END IF;
    END LOOP;

    EXCEPTION
        WHEN cnum_exception THEN
            DBMS_OUTPUT.PUT_LINE(cname_char || ' has no orders until 05.01.2010');
END;