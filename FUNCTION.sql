use KrunalDhote351 

create function cr()
returns int
as 
begin 
	return 1
end
select dbo.cr()
drop function dbo.cr

alter FUNCTION showTab()
returns table
AS
	return select * from EMPLOYEES;

SELECT * from dbo.showTab()


alter function someData()
RETURNS @newTab Table(
	fn varchar(30),
	ln varchar(30)
)
AS 
BEGIN
	INSERT INTO @newTab SELECT FirstName,LastName FROM EMPLOYEES;
	INSERT INTO @newTab SELECT ContactName,CompanyName FROM Customers;
	RETURN;
END

select * from  someData()

create table tr(
id int primary key identity(101,1),
fname varchar(30),
lname varchar(30),
tital varchar(30),
hiredate date,
city varchar(30)
)

insert into tr select E.FirstName,E.LastName,E.Title,E.HireDate,C.CityName from EMPLOYEES E
	JOIN City c On c.cID=c.cid



	truncate table tr


INSERT INTO SpOrder Values(104,'2023-01-11',2,30,102,0)
UPDATE spOrder Set PaymentStatus= case when OrderID=103 then 1
									  when OrderID=104 then 0
									  when OrderID=105 then 1
									end