create table Customer(
	customer_id int Identity(101,1),
	customer_fname varchar(30),
	customer_lname varchar(30),
	customer_gender char(1),
	customer_phn char(10),
	customer_mail varchar(30),
	customer_join DATE,
	address_id int,

	PRIMARY KEY(customer_id),
	Foreign Key(address_id) References Address(address_id)
)

create table Address(
	address_id int Identity(101,1),
	customer_street varchar(30),
	customer_town varchar(30),
	customer_postcode char(7),

	Primary Key(address_id)
)

create table Product(
	product_id int Identity(101,1),
	product_name varchar(30),
	product_price Decimal,
	product_type varchar(15),
	product_instock Bit

	PRIMARY KEY(product_id),
)

create table Orders(
	order_id int Identity(101,1),
	customer_id int,
	product_name varchar(30),
	quantity int,
	order_date Datetime Default CURRENT_TIMESTAMP,

	Primary Key(order_id),
	Foreign Key(customer_id) References Customer(customer_id)
)


Create Proc sp_InsCus
	@customer_fname varchar(30),
	@customer_lname varchar(30),
	@customer_gender char(1),
	@customer_phn char(10),
	@customer_mail varchar(30),
	@customer_join DATE,
	@address_id int
	as
	begin
		insert into customer values(@customer_fname,@customer_lname,@customer_gender,
									@customer_phn,@customer_mail,@customer_join,@address_id)
	end


EXEC sp_InsCus 'Shuvam','Kunwer','M','9876543211','Shuvam@gmail.com','2023-04-10',NULL

INSERT INTO Address Values('Ward 4','Tembhurkheda','444-906')

Update Customer Set address_id=101 where customer_id=101

INSERT INTO Product Values('Realme 9 Pro',18499,'Mobile',1)

INSERT INTO Orders Values(101,'Bhini',1,'2023‑04‑11 11:36:30',30)
delete from orders where order_id=103

alter table orders 
add product_price decimal
update orders set product_price=20 where order_id=104 

alter table orders 
add total_price as product_price*quantity


SELECT * FROM CUSTOMER
SELECT * FROM Address
SELECT * FROM Product
SELECT * FROM Orders

--(1) Write a SQL statement to find the total purchase amount of all orders.
select sum(product_price) from Product

--(2) Write a SQL statement to find the average purchase amount of all orders.
select avg(p.product_price * o.quantity) from product p
join orders o on o.product_name=p.product_name

--(3) Write a SQL statement to find the number of salesmen currently listing for all of their customers
select count(product_id) from product

--(4) Write a SQL statement to know how many customer have listed their names.
select count(customer_id) from customer

--(6) Write a SQL statement to get the maximum purchase amount of all the orders
select MAX(p.product_price * o.quantity) from product p 
join orders o on o.product_name=p.product_name

--(7) Write a SQL statement to get the minimum purchase amount of all the orders
select MIN(p.product_price * o.quantity) from product p 
join orders o on o.product_name=p.product_name

--(8) Write a SQL statement which selects the highest grade for each of the cities of the customers.  
select * from product where product_price=(select max(product_price) from product)

--(9) Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount.  
select customer_id,max(total_price) as Total_price from orders
group by customer_id

--(10) Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount. 
select customer_id,max(total_price),order_date from orders
group by customer_id,order_date

--(11) Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.
select customer_id,max(total_price) as total_price from orders
where order_date='2023-04-10'
group by customer_id

--(12) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000.  
select customer_id,max(total_price) as total_price,order_date as Order_Date from orders
where order_date='2023-04-10' and total_price>50
group by customer_id,order_date

--(13) Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000
select customer_id,max(total_price) as total_price,order_date as Order_Date from orders
where total_price between 30 and 50
group by customer_id,order_date

--(14) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.  
select customer_id,max(total_price) as total_price,order_date as Order_Date from orders
where total_price in (40,42,30,90)
group by customer_id,order_date

--(15) Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007.
select order_id,customer_id,max(total_price) as total_price,order_date as Order_Date from orders
where customer_id between 102 and 104
group by order_id,customer_id,order_date

--(16) Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000.  
select c.*,o.total_price from customer c 
join orders o on o.customer_id=c.customer_id
where o.total_price>30 and c.customer_id between 101 and 104

--(17) Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008. 
--(18) Write a SQL statement that counts all orders for a date August 17th, 2012. 
select count(customer_id) from orders where order_date='2023-04-10'

--(19) Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified.
--(20) Write a query that counts the number of salesmen with their order date and ID registering orders for each day.
--(21) Write a SQL query to calculate the average price of all the products. 
select avg(product_price) from product

--(22) Write a SQL query to find the number of products with a price more than or equal to Rs.350.
select count(product_id) from product where product_price>21

--(23) Write a SQL query to display the average price of each company's products, along with their code.
select avg(product_price),product.product_type from product where product_type = 'Mobile'
group by product_type

--(24) Write a query in SQL to find the sum of the allotment amount of all departments. 
--(25) Write a query in SQL to find the number of employees in each department along with the department code.