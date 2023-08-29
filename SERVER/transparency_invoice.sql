SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
eb invoice.electricityBoard%type;
bn invoice.bill_no%type;
r invoice.present_reading%type;
pv invoice.p_unit%type;
fc invoice.fixed_chrg%type;
t invoice.tax%type;
bill invoice.bill_amount%type;

n invoice.inv_id%type := &invoice_number;
p invoice.statusInv%type := '&invoice_status';

BEGIN
	IF (n>=305 AND n<=309) THEN 
		SELECT electricityBoard, bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount into eb,bn,r,pv,fc,t,bill from invoice@site1 where inv_id = n;
	
		DELETE FROM invoice@site1 WHERE inv_id= n;
	
		INSERT INTO invoice@site1(inv_id ,electricityBoard,bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv)values (n,eb,bn,r,pv,fc,t,bill,p);
	
	ELSIF (n>=300 AND n<=304) THEN 
	
		SELECT electricityBoard, bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount into eb,bn,r,pv,fc,t,bill from invoice@site2 where inv_id = n;
	
		DELETE FROM invoice@site2 WHERE inv_id= n;
	
		INSERT INTO invoice@site2(inv_id ,electricityBoard,bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv)values (n,eb,bn,r,pv,fc,t,bill,p);
	
	ELSE
		DBMS_OUTPUT.PUT_LINE('Out of Range!');
	END IF;
END;
/

select * from invoice@site1;
select * from invoice@site2;

commit;