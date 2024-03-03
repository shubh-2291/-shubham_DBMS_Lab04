create database if not exists e_commercedb;

use e_commercedb;

-- create table category
CREATE TABLE IF NOT EXISTS category (
  cat_id int NOT NULL DEFAULT 0,
  cat_name varchar(10) DEFAULT NULL,
  PRIMARY KEY (cat_id)
);

-- alter table category change cat_id size int;
-- desc table category;

-- insert data into table category
INSERT INTO category (cat_id, cat_name) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONIC'),
(5, 'CLOTHES');

-- create table product
CREATE TABLE IF NOT EXISTS product (
  pro_id int NOT NULL DEFAULT 0,
  pro_name varchar(20) NOT NULL DEFAULT 'Dummy',
  pro_desc varchar(60) DEFAULT NULL,
  cat_id int DEFAULT NULL,
  PRIMARY KEY (pro_id),
  KEY cat_id (cat_id)
);

-- insert data into table product
INSERT INTO product (pro_id, pro_name, pro_desc, cat_id) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- create table supplier
CREATE TABLE IF NOT EXISTS supplier (
  supp_id int NOT NULL DEFAULT 0,
  supp_name varchar(50) NOT NULL,
  supp_city varchar(50) NOT NULL,
  supp_phone varchar(50) NOT NULL,
  PRIMARY KEY (supp_id)
);

-- insert data into table supplier
INSERT INTO supplier (supp_id, supp_name, supp_city, supp_phone) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- create table supplier_pricing
CREATE TABLE IF NOT EXISTS supplier_pricing (
  pricing_id int NOT NULL DEFAULT 0,
  pro_id int DEFAULT NULL,
  supp_id int DEFAULT NULL,
  supp_price int DEFAULT 0,
  PRIMARY KEY (pricing_id),
  KEY pro_id (pro_id),
  KEY supp_id (supp_id)
);

-- insert data into table supplier_pricing
INSERT INTO supplier_pricing (pricing_id, pro_id, supp_id, supp_price) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

-- create table customer
CREATE TABLE IF NOT EXISTS customer (
  cus_id int NOT NULL DEFAULT 0,
  cus_name varchar(20) NOT NULL,
  cus_phone varchar(10) NOT NULL,
  cus_city varchar(30) NOT NULL,
  cus_gender char DEFAULT NULL,
  PRIMARY KEY (cus_id)
);

-- insert data into table customer
INSERT INTO customer (cus_id, cus_name, cus_phone, cus_city, cus_gender) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M'),
(6, 'VIRAT', '9890989065', 'DELHI', 'M'),
(7, 'ROHIT', '8888111222', 'MUMBIA', 'M');

-- create table orders
CREATE TABLE IF NOT EXISTS orders (
  ord_id int NOT NULL DEFAULT 0,
  ord_date date NOT NULL,
  cus_id int NOT NULL,
  pricing_id int DEFAULT NULL,
  PRIMARY KEY (ord_id),
  KEY cus_id (cus_id),
  KEY pricing_id (pricing_id)
);

-- insert data into table orders
INSERT INTO orders (ord_id, ord_date, cus_id, pricing_id) VALUES
(101, '2021-10-06', 2, 1),
(102, '2021-10-12', 3, 5),
(103, '2021-09-16', 5, 2),
(104, '2021-10-05', 1, 1),
(105, '2021-08-16', 4, 3),
(106, '2021-08-18', 1, 9),
(107, '2021-09-01', 3, 7),
(108, '2021-09-07', 5, 6),
(109, '2021-09-10', 5, 3),
(110, '2021-09-10', 2, 4),
(111, '2021-09-15', 4, 5),
(112, '2021-09-16', 4, 7),
(113, '2021-09-16', 1, 8),
(114, '2021-09-16', 3, 5),
(115, '2021-09-16', 5, 3),
(116, '2021-09-17', 2, 14),
(117, '2023-05-02', 4, 3);

-- create table rating
CREATE TABLE IF NOT EXISTS rating (
  rat_id int NOT NULL DEFAULT 0,
  ord_id int DEFAULT NULL,
  stars int DEFAULT NULL,
  PRIMARY KEY (rat_id),
  KEY ord_id (ord_id)
);

-- insert data into table rating
INSERT INTO rating (rat_id, ord_id, stars) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

-- 4) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
SELECT CUS_GENDER, COUNT(*) AS 'No of customer'  FROM CUSTOMER
JOIN ORDERS
using (CUS_ID)
JOIN SUPPLIER_PRICING
USING (PRICING_ID)
WHERE SUPP_PRICE >= 3000
GROUP BY cus_gender 
;

-- 5) Display all the orders along with product name ordered by a customer having Customer_Id=2
select * from orders
join supplier_pricing
using(pricing_id)
join product
using(pro_id)
where cus_id = 2;

-- 6) Display the Supplier details who can supply more than one product.
select supp_name, supp_city, supp_phone, supp_id, count(pro_id) as 'No of products' from supplier
join supplier_pricing
using(supp_id)
join product
using(pro_id)
group by supp_name, supp_city, supp_phone, supp_id
having count(pro_id)>1;

-- 7) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, Min_Price
FROM category c
JOIN product p ON c.CAT_ID = p.CAT_ID
JOIN (
    SELECT p.CAT_ID, MIN(sp.SUPP_PRICE) AS Min_Price
    FROM product p
    JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
    GROUP BY p.CAT_ID
) AS cheapest_prices ON p.CAT_ID = cheapest_prices.CAT_ID
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID AND cheapest_prices.Min_Price = sp.SUPP_PRICE
ORDER BY Min_Price ASC;;

-- 8) Display the Id and Name of the Product ordered after “2021-10-05”.
select pro_id, pro_name from product
join supplier_pricing
using (pro_id)
join orders
using (pricing_id)
where ord_date > '2021-10-05';

-- 9) Display customer name and gender whose names start or end with character 'A'.
select cus_name, cus_gender from customer
where cus_name like '%A' or cus_name like 'A%';

/* 10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier. */

DELIMITER &&  
CREATE PROCEDURE supplierValue()
BEGIN
SELECT supp_id, supp_name, AVG( stars ) as' avg rating',
Case
when AVG( stars )=5 then 'Excellent Service'
when AVG( stars )>4 then 'Good Service'
when AVG( stars )>3 then 'Average Service'
else 'Poor Service'
end as 'Type_of_Service'
FROM supplier
JOIN supplier_pricing
USING ( supp_id )
JOIN orders
USING ( pricing_id )
JOIN rating
USING ( ord_id )
GROUP BY supp_name, supp_id;
END &&  
DELIMITER ;

-- calling stored procedure
call supplierValue();















