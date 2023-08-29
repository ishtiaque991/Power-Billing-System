SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
ab billing.a_id%type;
pm billing.payment_mode%type;
pyd billing.pay_date%type;
bm billing.bill_amount%type;
pd billing.paid_amount%type;
ep billing.excess_paid%type;
n billing.bill_no%type;
p billing.statusb%type;

BEGIN
	FOR R IN ( SELECT bill_no,a_id, payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb from billing@site1 UNION(SELECT bill_no,a_id, payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb from billing UNION SELECT bill_no,a_id, payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb from billing@site2) ) LOOP	
		n := R.bill_no;
		ab := R.a_id;
		pm := R.payment_mode;
		pyd := R.pay_date;
		bm := R.bill_amount;
		pd := R.paid_amount;
		ep := R.excess_paid;
		p := R.statusb;
		
		
		
		DBMS_OUTPUT.PUT_LINE( n || '  |  ' ||  ab  || '  |  ' ||  pm || '  |  ' ||  pyd || '  |  ' ||  bm || '  |  ' ||  pd  || '  |  ' ||  ep  || '  |  ' ||  p );
		
	END LOOP;


END;
/

commit;