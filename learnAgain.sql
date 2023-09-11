create database KrunalDhote351
use KrunalDhote351
--second max salary

--best
select max(salary) as salary from salary where salary<(select max(salary) from salary)
--complex
select max(s1.salary) as salary from salary s1 join salary s2 on s1.id!=s2.id where s1.salary<s2.salary

--Learn SQL again

CREATE TABLE LearnAgain (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(150),
    LastName VARCHAR(150),
    Gender VARCHAR(20),
    DateOfBirth DATE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    CONSTRAINT fk_Department FOREIGN KEY (DepartmentID) REFERENCES Department(Id)
);

drop table LearnAgain

INSERT INTO LearnAgain(EmployeeID, FirstName, LastName, Gender, DateOfBirth, DepartmentID, HireDate, Salary) Values
    (1, 'John', 'Doe', 'Male', '1990-01-01', 1, '2020-01-01', 50000),
    (2, 'Jane', 'Smith', 'Female', '1992-05-10', 2, '2019-03-15', 60000),
    (3, 'Michael', 'Johnson', 'Male', '1985-09-20', 1, '2018-07-01', 55000),
    (4, 'Emily', 'Brown', 'Female', '1991-06-15', 3, '2021-02-28', 65000),
    (5, 'David', 'Wilson', 'Male', '1988-12-05', 2, '2017-09-10', 70000),
    (6, 'Sarah', 'Anderson', 'Female', '1993-08-25', 1, '2-04-20', 55000),
    (7, 'Daniel', 'Taylor', 'Male', '1987-03-12', 3, '2019-11-05', 60000),
    (8, 'Olivia', 'Clark', 'Female', '1990-07-18', 2, '2020-08-15', 00),
    (9, 'Matthew', 'Thomas', 'Male', '1989-04-30', 1, '2018-05-01', 55000),
    (10, 'Sophia', 'Walker', 'Female', '1994-02-22', 3, '2021-10-12', 70000),
    (11, 'Andrew', 'Lewis', 'Male', '1986-11-08', 2, '2017-06-25', 60000),
	(12, 'Ava', 'Hall', 'Female', '1991-09-14', 1, '2022-03-05', 55000),
    (13, 'Christopher', 'Young', 'Male', '1988-02-28', 3, '2019-10-01', 65000),
    (14, 'Mia', 'Lee', 'Female', '1993-01-07', 2, '2020-07-15', 70000),
    (15, 'Ethan', 'Harris', 'Male', '1987-07-23', 1, '2018-04-01', 55000),
    (16, 'Charlotte', 'Martin', 'Female', '2000-04-17', 3, '2021-12-18', 60000),
	(17, 'William', 'Thompson', 'Male', '2009-12-03', 2, '2017-08-10', 65000),
    (18, 'Amelia', 'White', 'Female', '1994-10-29', 1, '2022-01-20', 55000),
    (19, 'James', 'Adams', 'Male', '1986-06-13', 3, '2019-09-05', 70000),
    (20, 'Harper', 'Scott', 'Female', '1991-04-26', 2, '2020-06-12', 60000),
    (21, 'Benjamin', 'Mitchell', 'Male', '1988-01-10', 1, '2018-03-01', 55000)

--Row Number
select *, ROW_NUMBER() over(order by salary desc) as Rows from LearnAgain
--Rank
select *, Rank() over(order by salary desc) as Ranks from LearnAgain

--1.Query to find Second Highest Salary of Employee?(click for explaination)
Select Max(salary) from LearnAgain where salary<(select Max(salary) from LearnAgain)

--2.Query to find duplicate salary in table?(click here for explaination )
select * from learnagain E1 where salary=(select max(salary) from learnagain E2 where e2.salary=e1.salary)

--3.How to fetch  monthly Salary of Employee if annual salary is given?(click here for Explaination) 
select FirstName+' '+LastName as Name,Salary/12 as Salary from LearnAgain 

--4.What is the Query to fetch first record from Employee table? (90% asked Complex SQL Queries Examples)
select * from learnagain where EmployeeId=(select min(EmployeeId) from learnagain)

--5.What is the Query to fetch last record from the table?
select * from learnagain where EmployeeId=(select max(EmployeeId) from learnagain)

--6.What is Query to display first 5 Records from Employee table?(90% asked Complex SQL Queries Examples)
select top 5 * from learnagain

--7.What is Query to display last 5 Records from Employee table?(90% asked Complex SQL Queries Examples)
select top 5 * from learnagain order by EmployeeId Desc

--8.How to get 3 Highest salaries records from Employee table?
select distinct top 3 salary from learnagain order by salary desc

--9.How to Display Odd rows in Employee table?(90% asked Complex SQL Queries Examples)
select * from LearnAgain where EmployeeId%2!=0

--10.How to Display Even rows in Employee table
select * from LearnAgain where EmployeeId%2=0


--11.How to fetch 3rd highest salary using Rank Function?  
select * from (Select Dense_Rank() over(order by  salary desc) as Ranks,E.* from LearnAgain E) NewSelect where Ranks=3;

select max(salary) from learnagain where salary<(select max(salary) from learnagain 
	where salary<(select max(salary) from learnagain))

--12.How Can I create table with same structure of Employee table?(90% asked Complex SQL Queries Examples)
create table newTab as select * from LearnAgain   --giving error

--13.Display first 50% records from Employee table?
select top (select count(*)/2 from learnagain ) * from learnagain 

select * from learnagain where EmployeeId<=(select count(*)/2 from learnagain)

--14.Display last 50% records from Employee table?
select top (select count(*)/2 from learnagain ) * from learnagain order by employeeId desc

select * from learnagain where EmployeeId>=((select count(*) from learnagain)-(select count(*)/2 from learnagain))

--15.How Can I create table with same structure with data of Employee table?

--16.How do i fetch only common records between 2 tables
-- by using Intersect

--17.Find Query to get information of Employee where Employee is not assigned to the department.
update  learnagain set DepartmentId = null where EmployeeId=8
select * from LearnAgain where DepartmentId is null

--18.How to get distinct records from the table without using distinct keyword.
--19.Select all records from Employee table whose name is ‘Amit’ and ‘Pradnya’
select * from learnagain where firstname in ('John','Jane')

--20.Select all records from Employee table whose name is ‘Amit’ and ‘Pradnya’
select * from learnagain where firstname not in ('John','Jane','James')

--22.How to fetch all the records from Employee whose joining year is  2017?
select * from learnAgain where Year(HireDate)=2017

--23.What is SQL Query to find maximum salary of each department?
select max(salary) as Salary,d.Name  from learnagain l
	join department d on d.Id=l.departmentid
		where Departmentid is not null group by d.Name 

--24.How Do you find all Employees with its managers?(Consider there is manager id also in Employee table)
Select e.employee_name,m.employee_name from Employee e,Employee m where e.Employee_id=m.Manager_id;

--25.Display the name of employees who have joined in 2016 and salary is greater than 10000?

--duplicate
select salary from learnagain where salary<>(select max(salary) from learnagain b where salary=b.salary)