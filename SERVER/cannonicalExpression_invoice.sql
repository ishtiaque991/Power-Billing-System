SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
eb invoice.electricityBoard%type;
bn invoice.bill_no%type;
rp invoice.present_reading%type;
pv invoice.p_unit%type;
fc invoice.fixed_chrg%type;
t invoice.tax%type;
bill invoice.bill_amount%type;

n invoice.inv_id%type;
p invoice.statusInv%type;

BEGIN
	FOR R IN ( SELECT inv_id,electricityBoard, bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv from invoice@site1 UNION(SELECT inv_id,electricityBoard, bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv from invoice UNION SELECT inv_id,electricityBoard, bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv from invoice@site2 ) ) LOOP	
		n := R.inv_id;
		eb := R.electricityBoard;
		bn := R.bill_no;
		rp := R.present_reading;
		pv := R.p_unit;
		fc := R.fixed_chrg;
		t := R.tax;
		bill := R.bill_amount;
		p := R.statusInv;
		
		
		
		DBMS_OUTPUT.PUT_LINE( n || '  |  ' ||  eb  || '  |  ' ||  bn  || '  |  ' ||  rp || '  |  ' ||  pv || '  |  ' ||  fc  || '  |  ' ||  t  || '  |  ' ||  bill  || '  |  ' ||  p );
		
	END LOOP;


END;
/

commit;