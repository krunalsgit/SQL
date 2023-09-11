--Assignment 6

use KrunalDhote351

Create Table SpOrder(
	OrderID int identity(101,1) primary key,
	Customer_ID int,
	ProductID int,
	OrderDate date,
	Quantity int,
	ProductPrice decimal,
	TotalPrice as Quantity*ProductPrice, 
	foreign key(ProductID) references Product(Product_ID),
	foreign key(Customer_ID) references Customer(Customer_ID)
)



--1. Create a stored procedure called "get_customers" that returns all customers from the "customers" table.
create proc get_customers
as
begin
	Select * From Customer
end
exec get_customers

--2.Create a stored procedure called "get_orders" that returns all orders from the "orders" table.
create proc get_orders
as
begin
	Select * From SpOrder
end
exec get_orders

--3.Create a stored procedure called "get_order_details" that accepts an order ID as a parameter and returns the details of that order (i.e., the products and quantities).

create proc get_order_details
@id int
as
begin
	Select * From SpOrder where OrderID=@id 
end
exec get_order_details 2


--4.Create a stored procedure called "get_customer_orders" that accepts a customer ID as a parameter and returns all orders for that customer.
Alter proc get_customer_orders
@id int
as
begin
	Select * From SpOrder where Customer_ID=@id 
end
exec get_customer_orders 101

--5.Create a stored procedure called "get_order_total" that accepts an order ID as a parameter and returns the total amount of the order.
create proc get_order_total
@id int
as
begin
	Select TotalPrice From SpOrder where OrderID=@id 
end
exec get_order_total 1

--6.Create a stored procedure called "get_product_list" that returns a list of all products from the "products" table.
create proc get_product_list
as
begin
	Select * From Product 
end
exec get_product_list

--7.Create a stored procedure called "get_product_info" that accepts a product ID as a parameter and returns the details of that product.
create proc get_product_info
@id int
as
begin
	Select * From Product where product_id=@id
end
exec get_product_info 101

--8.Create a stored procedure called "get_customer_info" that accepts a customer ID as a parameter and returns the details of that customer.
create proc get_customer_info
@id int
as
begin
	Select * From customer where customer_id=@id
end
exec get_customer_info 101

--9.Create a stored procedure called "update_customer_info" that accepts a customer ID and new information as parameters and updates the customer's information in the "customers" table.
ALTER proc update_customer_info
@id int
as
begin
	BEGIN TRAN
	UPDATE Customer Set customer_phn='9876512341' where customer_id=@id
	COMMIT TRAN
end
exec update_customer_info 102

--10.Create a stored procedure called "delete_customer" that accepts a customer ID as a parameter and deletes that customer from the "customers" table.
create proc delete_customer
@id int
as
begin
	DELETE FROM Customer where customer_id=@id
end
exec delete_customer 104

--11.Create a stored procedure called "get_order_count" that accepts a customer ID as a parameter and returns the number of orders for that customer.
alter proc get_order_count
@id int
as
begin
	SELECT count(Customer_ID) From SpOrder where Customer_ID=@id
end
exec get_order_count 101

--12.Create a stored procedure called "get_customer_balance" that accepts a customer ID as a parameter and returns the customer's balance (i.e., the total amount of all orders minus the total amount of all payments).
alter proc get_customer_balance
@id int
as
begin
	SELECT SUM(totalPrice)-(select sum(totalPrice) from SpOrder where Customer_ID=@id and paymentstatus=1) From SpOrder Where Customer_ID=@id
end
exec get_customer_balance 102


--13.Create a stored procedure called "get_customer_payments" that accepts a customer ID as a parameter and returns all payments made by that customer.
create proc get_customer_payments
@id int
as
begin
	SELECT * from SpOrder where Customer_ID=@id and paymentstatus=1
end
exec get_customer_payments 101

--14.Create a stored procedure called "add_customer" that accepts a name and address as parameters and adds a new customer to the "customers" table.
create proc add_customer
@fname varchar(30),
@lname varchar(30),
@gender char(1),
@phone char(10),
@mail varchar(20),
@join date,
@addressID int
as
begin
	INSERT INTO CUSTOMER VALUES(@fname,@lname,@gender,@phone,@mail,@join,@addressID)
end
exec add_customer 'Varun','Potrun','M','9087654321','vrun@mail.com','1900-01-01',101


--15.Create a stored procedure called "get_top_products" that returns the top 10 products based on sales volume.
create proc get_top_products
as
begin
	select top 3 * from product 
end
exec get_top_products


--16.Create a stored procedure called "get_product_sales" that accepts a product ID as a parameter and returns the total sales volume for that product.
alter proc get_product_sales
@id int
as
begin
	select sum(o.Quantity) from product p
	join SpOrder o on p.product_id=o.ProductID
	where o.ProductID=@id
end
exec get_product_sales 102

--17.Create a stored procedure called "get_customer_orders_by_date" that accepts a customer ID and date range as parameters and returns all orders for that customer within the specified date range.
alter proc get_customer_orders_by_date
@id int,
@date1 date,
@date2 date
as
begin
	SELECT o.*,p.product_name FROM Customer c
	join SpOrder O on o.customer_id=c.customer_id
	join Product P on p.product_id=o.ProductID
	Where c.customer_id=@id and o.OrderDate Between @date1 and @date2
end
exec get_customer_orders_by_date 101,'2022-11-11','2023-04-12'


--18.Create a stored procedure called "get_order_details_by_date" that accepts an order ID and date range as parameters and returns the details of that order within the specified date range.
alter proc get_order_details_by_date
@id int,
@date1 date,
@date2 date
as
begin
	SELECT * FROM Customer c
	join SpOrder O on o.customer_id=c.customer_id
	join Product P on p.product_id=o.ProductID
	Where o.OrderID=@id and o.OrderDate Between @date1 and @date2
end
exec get_order_details_by_date 104,'2022-11-11','2023-04-12'

--19.Create a stored procedure called "get_product_sales_by_date" that accepts a product ID and date range as parameters and returns the total sales volume for that product within the specified date range.
create proc get_product_sales_by_date
@id int,
@date1 date,
@date2 date
as
begin
	select sum(o.Quantity) from product p
	join SpOrder o on p.product_id=o.ProductID
	where o.ProductID=@id and o.OrderDate Between @date1 and @date2
end
exec get_product_sales_by_date 101,'2022-11-11','2023-04-12'

--20.Create a stored procedure called "get_customer_balance_by_date" that accepts a customer ID and date range as parameters and returns the customer's balance within the specified date range.
create proc get_customer_balance_by_date
@id int,
@date1 date,
@date2 date
as
begin
	SELECT SUM(totalPrice)-(select sum(totalPrice) from SpOrder where Customer_ID=@id and paymentstatus=1)
	From SpOrder Where Customer_ID=@id and OrderDate Between @date1 and @date2

end
exec get_customer_balance_by_date 102,'2022-11-11','2023-04-12'


--21.Create a stored procedure called "add_order" that accepts a customer ID, order date, and total amount as parameters and adds a new order to the "orders" table.
Alter proc add_order
@id int,
@date date,
@pid int,
@qt int,
@price decimal
as
begin
	INSERT INTO SpOrder(ProductId,OrderDate,Quantity,ProductPrice,Customer_ID)
	Values(@pid,@date,@qt,@price,@id)
end

exec add_order 101,'2019-06-02',105,1,8499

--22.Create a stored procedure called "update_order_total" that accepts an order ID and a new total amount as parameters and updates the total amount of the order in the "orders" table.
alter proc update_order_total
@id int,
@qt int,
@price decimal
as
begin
	BEGIN TRAN
	UPDATE SpOrder SET 
		Quantity=@qt,
		ProductPrice=@price
		WHERE OrderID=@id
	COMMIT TRAN
end
exec update_order_total 107,3,30


--23.Create a stored procedure called "delete_order" that accepts an order ID as a parameter and deletes that order from the "orders" table.
create or alter proc delete_order
@id int
as
begin
	DELETE FROM SpOrder WHERE OrderID=@id
end
exec delete_order 106


DROP PROC delete_order

Select * From Customer
Select * From Product
Select * From SpOrder


