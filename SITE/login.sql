SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE mypack AS
    FUNCTION find_out(ID IN varchar, PASSWORD IN varchar, status IN OUT int) 
    RETURN int;

    PROCEDURE showResult(status2 IN int, PASSWORD2 IN varchar);
END mypack;
/

CREATE OR REPLACE PACKAGE BODY mypack AS

    FUNCTION find_out(ID IN varchar, PASSWORD IN varchar, status IN OUT int) 
    RETURN int
    IS 

    BEGIN 
        
        FOR I IN (select * from admins where login_id=ID) LOOP
            status :=1;
        END LOOP;

        FOR I IN (select * from admins where login_id=ID and securityKey=PASSWORD) LOOP
            status :=2;
        END LOOP;

        return status;

    END find_out; 
    

    PROCEDURE showResult(status2 IN int, PASSWORD2 IN varchar)
    IS

    BEGIN
        IF (status2 = 2) THEN 
            dbms_output.put_line('Welcome back ' || PASSWORD2 || '!'); 
        ELSIF (status2 = 1) THEN 
            dbms_output.put_line('Invalid credentials.'); 
        ELSE 
            dbms_output.put_line('Account not Found. You are not an admin'); 
        END IF;

    END showResult;
    
END mypack;
/



DECLARE
    ID admins.login_id%TYPE;
    PASSWORD admins.securityKey%TYPE;
    status int := 0;
    checkStatus int := 0;

    handle EXCEPTION;
    handle1 EXCEPTION;
    handle2 EXCEPTION;
	
BEGIN
    ID := '&ID';
    PASSWORD := '&PASSWORD';
    checkStatus := mypack.find_out(ID,PASSWORD,status);

    IF checkStatus=2 THEN
        RAISE handle2;
    ELSIF checkStatus=1 THEN
        RAISE handle1;
    ELSE
        RAISE handle;

    END IF;

    EXCEPTION
        WHEN handle THEN
           mypack.showResult(checkStatus,PASSWORD);
        WHEN handle1 THEN
            mypack.showResult(checkStatus,PASSWORD);
        WHEN handle2 THEN
           mypack.showResult(checkStatus,PASSWORD);
		   
END;
/

CREATE OR REPLACE TRIGGER Hello1 
AFTER INSERT
ON admins
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Credentials inserted');
END;
/