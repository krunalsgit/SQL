--Creating Database
CREATE DATABASE KrunalDhote351

--Use that DB
USE KrunalDhote351 

--creating Tbale
CREATE TABLE Employee(
	emp_id int primary key,
	fullName varchar(100) NOT NULL,
	Age int check(Age>20),
	DOB Date not null,
	City varchar(100) not null,
	Phone BIGINT Not Null Unique check(6000000000<=Phone AND Phone<=9999999999),
	Gender varchar(15) Not Null,
	companyName varchar(200) DEFAULT 'Shaligram Infotech LLP'
)

-- Employee --Select and press alt+f1 to see scheema of table
Drop table Employee

CREATE TABLe dept(
	id int not null
)

--Deleting Table
DROP TABLE dept

--create table Department
CREATE TABLE Department(
	Dept_ID int NOT NULL Identity(1,1),
	DeptName varchar(100) NOT NULL,
	Primary Key(Dept_ID)
)

--Screma of Table 
--sp_help Department								--Aadhar

ALTER TABLE Employee                                 
	ADD Aadhar char(12)


ALTER TABLE Employee 
	ALTER COLUMN Aadhar char(12) not null;

--not alter yet throwing errors because of constraint
ALTER TABLE Employee 
	Alter Column Phone char(10); 

ALTER TABLE Employee 
	Alter Column Gender Varchar(12)


ALTER TABLE Employee 
	ADD AccountNumber char(12) Unique;

--remove constraint before drop 
ALTER TABLE EMPLOYEE 
	DROP CONSTRAINt UQ__Employee__BE2ACD6FA84A3A53;

--Delete column
ALTER TABLE Employee 
	Drop Column AccountNumber;


ALTER TABLE Department 
	DROP CONSTRAINT FK__Departmen__Dept___2F10007B;

--Foreign Key 
ALTER TABLE Employee
	ADD Dept_ID int REFERENCES Department(Dept_ID);

Alter Table Employee
	ADD Salary MONEY Not Null Check(Salary>=0);

Alter Table Employee
	ADD Designation varchar(50);

Alter Table Employee
	Alter Column Designation varchar(50) Not Null;

Alter Table Employee
	Add HireDate Date;

ALTER TABLE Employee
	ALTER COLUMN HireDate Date Not Null;


INSERT INTO Employee(emp_id,fullName,Age,DOB,City,Phone,Gender,Aadhar,Salary,Designation,HireDate) Values(351,'Krunal Dhote',21,'2001-10-09','Amravati',9307871334,'Male','750109816681',5000,'.NET Developer','2023-02-06')

INSERT INTO Department Values('IT');
INSERT INTO Department VALUES('Sales');
INSERT INTO Department VALUES('HR');
INSERT INTO Department VALUES('CEO');
INSERT INTO Department VALUES('Management');


INSERT INTO Department Values(
	('IT'),
	('Sales'),
	('HR'),
	('CEO'),
	('Management')
);

--Can't Truncate because of Constraint Foreign Key
Truncate Table Department;


UPDATE Employee 
	SET Dept_ID=1 WHERE Emp_ID=351;



ALTER TABLE Employee 
	ADD Constraint uniqueAccNO UNIQUE(AccountNumber)

Alter Table EMployee
	DROP CONSTRAINT uniqueAccNo

Alter TABLE EMPLOYEE
	ALTER COLUMN AccountNumber char(15)

--Drop Constrain
ALTER TABLE Employee 
	DROP CONSTRAINT PK__Employee__1299A861F21900E2;

--Add Constraint
ALTER TABLE Employee 
	ADD CONSTRAINT pKconstraintEmp PRIMARY KEY (EMP_ID);

--Rename Column
exec sp_RENAME 'Employee.emp_id','Emp_ID','COLUMN'

		
ALTER TABLE Employee 
	ADD CreatedOn DATETIME;


ALTER TABLE Employee
	ADD CONSTRAINT DfCurrentTime Default GETDATE() FOR CreatedOn

		
INSERT INTO Employee(emp_id,fullName,Age,DOB,City,Phone,Gender,Aadhar,Salary,Designation,HireDate) 
	Values(352,'Piyush Kumar',21,'2001-01-13','Amravati',9370567810,'Male','125478129012',5000,'.NET Developer','2023-02-06')

INSERT INTO Employee(Emp_ID,fullName,Age,DOB,City,Phone,Gender,Aadhar,AccountNumber,Salary,Designation,HireDate) 
	Values(351,'Krunal Dhote',21,'2001-01-13','Amravati',9307871334,'Male','750109816681','968010110005769',5000,'.NET Developer','2023-02-06')

UPDATE Employee
	SET Dept_ID=1 WHERE Emp_ID=351

DELETE FROM Employee 
	WHERE Emp_ID=351

ALTER TABLE Employee
	DROP CONSTRAINT checkAadhar

	
	ALTER TABLE EMPLOYEE
	DROP column Aadhar




--Inner Join
select * from Employee e inner join Department d on e.Dept_ID = d.Dept_ID

--Left Join
select * from Employee e LEFT JOIN Department d ON e.Dept_id=d.Dept_id

--Right Join
select * from employee e Right Join Department d on e.Emp_id=d.Dept_ID

select * from Department d Right Join Employee e on e.Emp_id=d.Dept_ID


--Transactions
BEGIN TRAN
	UPDATE EMPLOYEE	
		SET AGE=22 WHERE Emp_ID=352
COMMIT TRAN
ROLLBACK TRAN

--Transactions
BEGIN TRAN
UPDATE EMPLOYEE
	SET Aadhar='129012120121' WHERE Emp_ID=352
COMMIT TRAN
ROLLBACK TRAN


--NOLOCK
SELECT * FROM Employee WITH(NOLOCK);

SELECT * FROM Department;



