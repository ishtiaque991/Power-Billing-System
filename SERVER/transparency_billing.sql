SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
ab billing.a_id%type;
pm billing.payment_mode%type;
pyd billing.pay_date%type;
bm billing.bill_amount%type;
pd billing.paid_amount%type;
ep billing.excess_paid%type;

n billing.bill_no%type := &bill_number;
p billing.statusb%type := '&billing_status';

BEGIN
	
	IF (n>=600 AND n<=604) THEN 
	
		SELECT a_id, payment_mode,pay_date,bill_amount,paid_amount,excess_paid into ab, pm,pyd,bm,pd,ep from billing@site1 where bill_no = n;
	
		DELETE FROM billing@site1 WHERE bill_no= n;
	
		INSERT INTO billing@site1(bill_no,a_id,payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb)values (n,ab,pm,pyd,bm,pd,ep,p);
		
	ELSIF (n>=605 AND n<=609) THEN 
	
		SELECT a_id, payment_mode,pay_date,bill_amount,paid_amount,excess_paid into ab, pm,pyd,bm,pd,ep from billing@site2 where bill_no = n;
	
		DELETE FROM billing@site2 WHERE bill_no= n;
	
		INSERT INTO billing@site2(bill_no,a_id,payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb)values (n,ab,pm,pyd,bm,pd,ep,p);
		
	ELSE
		DBMS_OUTPUT.PUT_LINE('Out of Range!');
	END IF;	
	
	
END;
/
select * from billing@site1;
select * from billing@site2;


commit;