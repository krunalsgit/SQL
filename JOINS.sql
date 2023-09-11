--JOIN PRACTICES


Use KrunalDhote351

CREATE TABLE EMPLOYEES(
	EmployeeID int identity(1,1) primary key,
	LastName varchar(30),
	FirstName varchar(30),
	Title varchar(30),
	BirthDate date,
	HireDate date,
	ReportsTo int,
	Address varchar(30),
)

CREATE TABLE Customers(
	CustomerID int identity(1,1) primary key,
	CompanyName varchar(30),
	ContactName varchar(30),
	ContactTitle varchar(30),
	Address varchar(30),
	City varchar(30),
	Country varchar(30)
)

CREATE TABLE Orders(
	OrderID int identity(101,1) primary key,
	CustomerID int,
	EmployeeID int,
	OrderDate date,
	foreign key(EmployeeID) references Employees(EmployeeID),
	foreign key(CustomerID) references Customers(CustomerID)
)

INSERT INTO Employees Values('Patel','Parth','MD','1984-08-19','2023-02-06',NULL,'Ahmdabad'),

INSERT INTO EMPLOYEES Values
('Dionsetto', 'Carolynn', 'Data Coordinator', '1984-08-19','2023-02-06', 4, 'Carvalhal'),
('Flaverty', 'Viola', 'Registered Nurse', '1984-08-19','2023-02-06', 4, 'Neebing'),
('Oaker', 'Rasia', 'Geological Engineer', '1984-08-19','2023-02-06',4, 'Ruilin'),
('Schlagtmans', 'Rossy', 'Senior Quality Engineer', '1984-08-19','2023-02-06',4, 'Navan'),
('Alleyne', 'Arlin', 'Recruiting Manager', '1984-08-19','2023-02-06', 4, 'Hanušovice'),
('Money', 'Blakelee', 'Professor', '1984-08-19','2023-02-06', 4, 'Badajoz'),
('Bostock', 'Dixie', 'Business Systems Development', '1984-08-19','2023-02-06', 4, 'Sinarbakti'),
('Lejeune', 'Emerson', 'Media Manager III', '1984-08-19','2023-02-06', 4, 'Salento'),
( 'Miebes', 'Bree', 'Account Coordinator', '1984-08-19','2023-02-06', 4, 'Bulag')

insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Dabtype', 'Ethan Parkeson', 'Environmental Tech', '7068 Ruskin Parkway', 'Ricardo Flores Magon', 'Mexico');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('LiveZ', 'Noell Hyde', 'Quality Control Specialist', '1098 Northridge Parkway', 'Xuefu', 'China');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Eidel', 'Oralie Edie', 'Product Engineer', '5 Meadow Vale Plaza', 'Veliko Tŭrnovo', 'Bulgaria');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Thoughtworks', 'Constantine Sirmond', 'Occupational Therapist', '77864 Thierer Parkway', 'Córdoba', 'Colombia');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Gabtype', 'Lexis Kasperski', 'Physical Therapy Assistant', '5529 Farmco Court', 'Telmin Suma', 'Mongolia');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Skipfire', 'Camila Froment', 'Product Engineer', '899 Cottonwood Center', 'Machang', 'China');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Oyoyo', 'Raffarty Pull', 'Office Assistant II', '69 Nancy Pass', 'Tahe', 'China');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Browsebug', 'Scottie Wrixon', 'Senior Developer', '24578 Namekagon Pass', 'Chemodanovka', 'Russia');
insert into Customers (CompanyName, ContactName, ContactTitle, Address, City, Country) values ('Flashspan', 'Gusty Ogg', 'Staff Scientist', '273 Scoville Parkway', 'Mabini', 'Philippines');

insert into Orders Values(4,4,'2021-04-22')
insert into Orders Values(5,26,'2021-04-22')
insert into Orders Values(7,28,'2022-04-22')
insert into Orders Values(2,30,'2022-05-12')
insert into Orders Values(8,30,'2020-05-12')
insert into Orders Values(9,29,'2020-05-12')
insert into Orders Values(4,3,'2020-11-12')

--1 Write a SQL query to retrieve the list of all orders made by customers in the "USA".
select * from orders o 
join customers c on c.CustomerID=o.CustomerID
where c.Country='China'

--2 Write a SQL query to retrieve the list of all customers who have placed an order.
select * from customers c 
join orders o on c.CustomerID=o.CustomerID

--3 Write a SQL query to retrieve the list of all employees who have not yet placed an order.
select * from Employees e
left join orders o on o.EmployeeID=e.employeeId 
where o.employeeId is null

--4 Write a SQL query to retrieve the list of all employees who have placed an order.
select * from Employees e
join orders o on o.EmployeeID=e.employeeId 

--5 Write a SQL query to retrieve the list of all customers who have not yet placed an order.
select * from Customers c 
left join orders o on o.CustomerID=c.CustomerID
where o.CustomerID is null

--6 Write a SQL query to retrieve the list of all customers who have placed an order, along with the order date.
select c.*,o.OrderDate from Customers c 
join orders o on o.CustomerID=c.CustomerID

-- 7 Write a SQL query to retrieve the list of all orders placed by a particular customer.
select * from orders where customerId=2


--8 Write a SQL query to retrieve the list of all orders placed by a particular employee.
select * from orders where EmployeeID=30

--9 Write a SQL query to retrieve the list of all orders placed by a particular customer on a particular date.
select * from orders where customerID=2 and orderDate='2022-05-12'

--10 Write a SQL query to retrieve the list of all customers who have not yet placed an order, sorted by their country.
select * from Customers c 
left join orders o on o.CustomerID=c.CustomerID
where o.CustomerID is null
Order By C.Country 

--11 Write a SQL query to retrieve the list of all orders placed by customers in the "USA", sorted by order date.
select * from orders o 
join customers c on c.CustomerID=o.CustomerID
where c.Country='China' 
order by o.OrderDate

--12 Write a SQL query to retrieve the list of all employees who have not yet placed an order, sorted by last name.
select * from Employees e
left join orders o on o.EmployeeID=e.employeeId 
where o.employeeId is null
order by e.LastName

--13 Write a SQL query to retrieve the list of all customers who have placed an order, sorted by their company name.
select * from Customers c 
join orders o on o.CustomerID=c.CustomerID
Order By C.CompanyName

--14 Write a SQL query to retrieve the list of all employees who have placed an order, sorted by their hire date.
select * from Employees e
join orders o on o.EmployeeID=e.employeeId 
order by e.HireDate

--15 Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, sorted by their company name.
select * from customers c
join Orders o on o.CustomerID=c.CustomerID 
where orderDate='2021-04-22'
order by c.CompanyName

--16 Write a SQL query to retrieve the list of all customers who have placed an order, along with the employee who handled the order.
select c.*,e.*,o.OrderID from customers c
join Orders o on o.CustomerID=c.CustomerID 
join Employees e on o.EmployeeID=e.EmployeeID

--17 Write a SQL query to retrieve the list of all employees who have placed an order, along with the customer who placed the order.
select e.*,c.*,o.OrderID from Employees e
join Orders o on e.EmployeeID=o.EmployeeID 
join Customers c on o.CustomerID=c.CustomerID

--18 Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date.
select c.ContactName,c.country,o.OrderDate from customers c
join orders o on o.CustomerID=c.CustomerID
where c.Country='china'

--19 Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular year, along with the employee name and order date.
select e.*,o.OrderDate from Employees e
join Orders o on e.EmployeeID=o.EmployeeID 
where YEAR(e.BirthDate)=2001

--20 Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order.
select c.ContactName,o.OrderDate,e.* from customers c
join Orders o on o.CustomerID=c.CustomerID 
join Employees e on o.EmployeeID=e.EmployeeID

--21 Write a SQL query to retrieve the list of all orders placed by customers who have a particular contact title, along with the customer name and order date.
select c.ContactName,o.OrderDate,c.ContactTitle from customers c
join Orders o on o.CustomerID=c.CustomerID 
where ContactTitle='Quality Control Specialist'

--22 Write a SQL query to retrieve the list of all orders placed by employees who have a particular job title, along with the employee name and order date.
select e.FirstName,e.LastName,e.Title,o.OrderDate from Employees e
join orders o on o.EmployeeID=e.employeeId 
where e.Title='Developer'

--23 Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, along with the customer name, order date, and employee who handled the order.
select c.ContactName,o.OrderDate,e.FirstName,e.LastName from customers c
join Orders o on o.CustomerID=c.CustomerID 
join Employees e on o.EmployeeID=e.EmployeeID
where orderDate='2020-05-12'

--24 Write a SQL query to retrieve the list of all orders placed by customers in a particular city, along with the customer name and order date.
select c.ContactName,o.OrderDate,c.city from customers c
join Orders o on o.CustomerID=c.CustomerID 
where c.city='Xuefu'

--25 Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular city, along with the employee name and order date.
select e.*,o.OrderDate from Employees e
join Orders o on e.EmployeeID=o.EmployeeID 
where E.Address='Amravati'

--26 Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order, sorted by order date.
select c.ContactName,o.OrderDate,e.* from customers c
join orders o on o.CustomerID=c.CustomerID
join EMPLOYEES e on e.EmployeeID=o.EmployeeID
order by o.OrderDate

--27 Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date, sorted by order date.
select C.ContactName,O.OrderDate,C.City from Customers C
Join Orders O on O.CustomerID=C.CustomerID
Where C.Country='China'
Order By O.OrderDate


select * from Employees
select * from Customers
select * from Orders








