SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
cn  customer.cust_name%type;
ct  customer.city%type;
em  customer.email_id%type;
st  customer.cust_status%type;
fd  feedback.feedback_status%type;

BEGIN
	DBMS_OUTPUT.PUT_LINE('cust_name ' || '  |  ' || 'city' || '  |  ' || 'email_id' || '  |  ' || 'cust_profession' || '  |  ' || 'feedback_status');
	DBMS_OUTPUT.PUT_LINE('----------' || '  |  ' || '----' || '  |  ' || '--------' || '  |  ' || '---------------' || '  |  ' || '---------------');
	
	FOR R IN (SELECT C.cust_name,C.city,C.email_id,C.cust_status,F.feedback_status  from customer@site1 C inner join feedback@site2 F on C.cust_id=F.cust_id where C.city ='Dhaka') LOOP	
		cn := R.cust_name;
		ct := R.city;
		em := R.email_id;
		st := R.cust_status;
		fd := R.feedback_status;
		DBMS_OUTPUT.PUT_LINE( cn || '  |  ' ||  ct || '  |  ' ||  em || '  |  ' ||  st || '  |  ' ||  fd );
		
	END LOOP;
END;
/
commit;