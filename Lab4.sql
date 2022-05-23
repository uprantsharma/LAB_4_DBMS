Create Table supplier (
SUPP_ID INT Primary Key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL
);

insert into Supplier Values ('1','Rajesh Retails','Delhi','1234567890');
insert into Supplier Values ('2','Appario Ltd.','Mumbai','2589631470');
insert into Supplier Values ('3','Knome products','Banglore','9785462315');
insert into Supplier Values ('4','Bansal Retails','Kochi','8975463285');
insert into Supplier Values ('5','Mittal Ltd.','Lucknow','7898456532');

select * from Supplier;
drop table Supplier;

Create Table customer(
CUS_ID INT Primary Key,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30),
CUS_GENDER CHAR );

insert into Customer Values ('1','AAKASH','9999999999','DELHI','M');
insert into Customer Values ('2','AMAN','9785463215','NOIDA','M');
insert into Customer Values ('3','NEHA','9999999999','MUMBAI','F');
insert into Customer Values ('4','MEGHA','9994562399','KOLKATA','F');
insert into Customer Values ('5','PULKIT','7895999999','LUCKNOW','M');

select * from customer;
drop table Customer;


Create table category(
CAT_ID INT Primary Key,
CAT_NAME VARCHAR(20) NOT NULL);

Insert into Category values ('1','BOOKS');
Insert into Category values ('2','GAMES');
Insert into Category values ('3','GROCERIES');
Insert into Category values ('4','ELECTRONICS');
Insert into Category values ('5','CLOTHES');

select * from category;
drop table category;


Create Table product (
PRO_ID INT Primary Key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT, 
FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

insert into Product Values('1','GTA V','Windows 7 and above with i5 processor and 8GB RAM','2');
insert into Product Values('2','TSHIRT','SIZE-L with Black, Blue and White variations','5');
insert into Product Values('3','ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD','4');
insert into Product Values('4','OATS','Highly Nutritious from Nestle','3');
insert into Product Values('5','HARRY POTTER','Best Collection of all time by J.K Rowling','1');
insert into Product Values('6','MILK','1L Toned MIlk','3');
insert into Product Values('7','Boat Earphones','1.5Meter long Dolby Atmos','4');
insert into Product Values('8','Jeans','Stretchable Denim Jeans with various sizes and color','5');
insert into Product Values('9','Project IGI','compatible with windows 7 and above','2');
insert into Product Values('10','Hoodie','Black GUCCI for 13 yrs and above','5');
insert into Product Values('11','Rich Dad Poor Dad','Written by RObert Kiyosaki','1');
insert into Product Values('12','Train Your Brain','By Shireen Stephen','1');

select * from product;
drop table product;

Create table supplier_pricing(
PRICING_ID INT Primary Key,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
FOREIGN KEY (PRO_ID) REFERENCES Product(PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

select * from supplier_pricing;
drop table Supplier_pricing

Create Table `order`(
ORD_ID INT Primary Key,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
PRICING_ID INT,
FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);
/*
drop table `order`
Order in the Keyword in MySQL so we can't create tbale directly with the name of 'Order' 
although we have some way to create the table with using some special char
*/

Insert into `Order` values('101','1500','2021-10-06','2','1');
Insert into `Order` values('102','1000','2021-10-12','3','5');
Insert into `Order` values('103','30000','2021-09-16','5','2');
Insert into `Order` values('104','1500','2021-10-05','1','1');
Insert into `Order` values('105','3000','2021-08-16','4','3');
Insert into `Order` values('106','1450','2021-08-18','1','9');
Insert into `Order` values('107','789','2021-09-01','3','7');
Insert into `Order` values('108','780','2021-09-07','5','6');
Insert into `Order` values('109','3000','2021-01-10','5','3');
Insert into `Order` values('110','2500','2021-09-10','2','4');
Insert into `Order` values('111','1000','2021-09-15','4','5');
Insert into `Order` values('112','789','2021-09-16','4','7');
Insert into `Order` values('113','31000','2021-09-16','1','8');
Insert into `Order` values('114','1000','2021-09-16','3','5');
Insert into `Order` values('115','3000','2021-09-16','5','3');
Insert into `Order` values('116','99','2021-09-17','2','14');

drop table `order`
select * from `order`

Create table rating(
RAT_ID INT Primary Key,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID) );


select * from rating

 Insert into Rating Values ('1','101','4');
 Insert into Rating Values ('2','102','3');
 Insert into Rating Values ('3','103','1');
 Insert into Rating Values ('4','104','2');
 Insert into Rating Values ('5','105','4');
 Insert into Rating Values ('6','106','3');
 Insert into Rating Values ('7','107','4');
 Insert into Rating Values ('8','108','4');
 Insert into Rating Values ('9','109','3');
 Insert into Rating Values ('10','110','5');
 Insert into Rating Values ('11','111','3');
 Insert into Rating Values ('12','112','4');
 Insert into Rating Values ('13','113','2');
 Insert into Rating Values ('14','114','1');
 Insert into Rating Values ('15','115','1');
 Insert into Rating Values ('16','116','0');

select * from rating
drop table rating


/*
Answer of Question no : 3 - Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
*/

select c.CUS_GENDER, count(c.CUS_ID) from customer c inner join `Order` o
on c.CUS_ID=o.CUS_ID where o.ORD_AMOUNT>='3000' group by c.CUS_GENDER; 


/*
Answer of Question no : 4 - Display all the orders along with product name ordered by a customer having Customer_Id=2
*/

select c.CUS_NAME, o.ORD_ID, o.ORD_DATE, p.PRO_NAME from customer as c, `order` as o, product as p, 
Supplier_pricing as sp where c.cus_id=2 and o.CUS_ID=c.CUS_ID and 
o.PRICING_ID=sp.PRICING_ID and 
p.PRO_ID=sp.PRO_ID;

/*
Answe of Question no : 5 - Display the Supplier details who can supply more than one product.
*/

select sup.SUPP_ID, supp_name, supp_city, supp_phone 
from supplier as sup
inner join
(
select SUPP_ID, count(SUPP_ID) from supplier_pricing group by 
SUPP_ID having count(supp_id) > 1 
) as sp
on sup.supp_id = sp.supp_id; 

/*
Answer of Question No : 6 - Find the least expensive product from each category and print the table with category id,
 name, product name and price of the product
*/

select cat.CAT_ID, CAT_NAME, PRO_ID, PRO_NAME, min(MIN_PRICE) from category as cat
join
(select prod.PRO_ID, PRO_NAME, CAT_ID, MIN_PRICE from product as prod
join
(select pro_id as PRO_ID, min(supp_price) as MIN_PRICE from supplier_pricing group by PRO_ID) as sp
on prod.pro_id = sp.pro_id)
as pro_sp
on cat.cat_id = pro_sp.CAT_ID
group by cat_id;

/*
 Answer of Question No : 7 - Display the Id and Name of the Product ordered after “2021-10-05”.
*/

select pr.PRO_ID, pr.PRO_NAME, ord_pr.ORD_DATE from product as pr 
JOIN 
( select sp.PRO_ID, sp.PRICING_ID, ord.ORD_DATE FROM supplier_pricing as sp 
JOIN 
`order` as ord on sp.PRICING_ID= ord.PRICING_ID  where ord.ORD_DATE> "2021-10-05")  
as ord_pr 
on pr.PRO_ID= ord_pr.PRO_ID;


/*
 Answer of Question No : 8 -Display customer name and gender whose names start or end with character 'A'.
*/

select CUS_NAME, CUS_GENDER from customer where CUS_NAME like "A%" or CUS_NAME like "%A";

/*
Answer of Question : 9 - Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
If rating >2 print “Average Service” else print “Poor Service”.
*/


CREATE DEFINER=`root`@`localhost` PROCEDURE `SupplierDetails`()
BEGIN
select report.supplierDetails,report.supp_name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
(select final.supplierDetails, supplier.supp_name, final.Average from
(select supplierDetails, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id as supplierDetails, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplierDetails)
as final inner join supplier where final.supplierDetails = supplier.supp_id) as report;
END


call SupplierDetails();