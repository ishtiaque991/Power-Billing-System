DROP TABLE admins;
DROP TABLE billing;
DROP TABLE invoice;
DROP TABLE customer;
DROP TABLE feedback;

SET LINESIZE 5000;

CREATE TABLE admins(
	admin_id int,
	admin_name varchar2(25),
	login_id varchar2(25),
	securityKey varchar2(25));
		

insert into admins (admin_id,admin_name,login_id,securityKey)values (200,'Ishtiaque','Ishtiaque20','Ishtiaque20');
insert into admins (admin_id,admin_name,login_id,securityKey)values (201,'Raisa','Raisa30','Raisa30');
insert into admins (admin_id,admin_name,login_id,securityKey)values (202,'Punni','Punni40','Punni40');

select * from admins;

CREATE TABLE billing(
	bill_no int,
	a_id int,
	payment_mode VARCHAR2(25),
	pay_date varchar2(20),
	bill_amount FLOAT,
	paid_amount FLOAT,
	excess_paid FLOAT,
	statusb varchar2(25));
		

insert into billing(bill_no,a_id,payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb)values (610,65,'On_Cheque','2022/08/25',4000.00,5550.00,1550.00,'unpaid');
insert into billing(bill_no,a_id,payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb)values (611,38,'On_Cheque','2022/08/26',3000.00,5000.00,2000.00,'paid');
insert into billing(bill_no,a_id,payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb)values (612,45,'On_Cheque','2022/08/27',7000.00,8250.00,1250.00,'unpaid');
insert into billing(bill_no,a_id,payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb)values (613,86,'On_Cheque','2022/08/28',2000.00,3250.00,1250.00,'paid');
insert into billing(bill_no,a_id,payment_mode,pay_date,bill_amount,paid_amount,excess_paid,statusb)values (614,73,'On_Cheque','2022/08/29',6000.00,7250.00,1250.00,'unpaid');

select * from billing;

CREATE TABLE invoice(
	inv_id int,
	electricityBoard varchar2(25),
	bill_no int,
	present_reading float,
	p_unit float,
	fixed_chrg float,
	tax float,
	bill_amount FLOAT,
	statusInv varchar2(25));
	

insert into invoice(inv_id,electricityBoard,bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv)values (310, 'Gulshan', 612,400.00,200.00,500.00,70.00,570.00,'unpaid');
insert into invoice(inv_id,electricityBoard,bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv)values (311, 'Gulshan', 610,700.00,300.00,300.00,40.00,340.00,'paid');
insert into invoice(inv_id,electricityBoard,bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv)values (312, 'Gulshan', 614,600.00,400.00,200.00,60.00,260.00,'unpaid');
insert into invoice(inv_id,electricityBoard,bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv)values (313, 'Gulshan', 613,500.00,250.00,400.00,80.00,480.00,'paid');
insert into invoice(inv_id,electricityBoard,bill_no,present_reading,p_unit,fixed_chrg,tax,bill_amount,statusInv)values (314, 'Gulshan', 611,800.00,200.00,300.00,20.00,320.00,'unpaid');
	
select * from invoice;
	
CREATE TABLE customer(
        cust_id int,
        cust_name varchar2(25),
		account_type varchar2(25),
		cust_address varchar2(30),
		cust_state  varchar2(25),
		city     varchar2(25),
		pincode  varchar2(25),
		email_id  varchar2(25),
		cust_pass varchar2(25),
		cust_status varchar2(25));
	 

insert into customer values(1,'Rita','customer','Uttora','Pemanent','Naoga','D1207','rita@gmail.com','rita4532ah','businessman');
insert into customer values(2,'mita','customer','Dhanmondi','Temporary','Dhaka','D1205','mita@gmail.com','mita4532ah','lawyer');	
insert into customer values(3,'jannat','customer','Kolabagan','Permanent','Dhaka','D1208','jannat@gmail.com','jannat4532ah','doctor');	
insert into customer values(4,'Raisa','customer','Mirpur','Permanent','Cumilla','D1209','raisa@gmail.com','raisa4532ah','employee');	
insert into customer values(5,'Zuthi','customer','Modhubaag','Permanent','Ctg','D1211','zuthi@gmail.com','zuthi4532ah','faculty');	
insert into customer values(6,'Istiaque','customer','Jhilpaar','Permanent','Borishal','D1202','ishti@gmail.com','Ish4532ah','lawyer');

select * from customer;

CREATE TABLE feedback(
        feedback_id int,
		cust_id  int,
		feedback_details  varchar2(25),
		feedback_date    varchar2(25),
		feedback_status   varchar2(25));
		
insert into feedback values (151,4,'Service is Good','12/08/2022','Good');
insert into feedback values (152,8,'Service Very Good','09/07/2022','Bad');
insert into feedback values (153,3,'Service is Bad','22/08/2022','Good');
insert into feedback values (154,2,'Service is Good','11/06/2022','Bad');
insert into feedback values (155,9,'Service is Not Good','18/04/2022','Good');	
insert into feedback values (156,11,'Service is Poor','17/08/2022','Good');

select * from feedback;

CREATE OR REPLACE TRIGGER Hello 
AFTER INSERT
ON customer
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Credentials Inserted!!');
END;
/
		
commit;



