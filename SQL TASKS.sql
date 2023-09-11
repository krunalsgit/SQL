--TASK 1 :- Ceate database, create table and alter the values in table, use as much as datatypes.
	
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

	--Alter the Table
	ALTER TABLE Employee                                 
		ADD Aadhar char(12)

	ALTER TABLE Employee 
		ALTER COLUMN Aadhar char(12) not null;
	
	ALTER TABLE Employee 
		Alter Column Gender Varchar(12)

	ALTER TABLE Employee 
		ADD AccountNumber char(12) Unique;

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

	ALTER TABLE Employee 
		ADD CreatedOn DATETIME;

	ALTER TABLE Employee
		ADD CONSTRAINT DfCurrentTime Default GETDATE() FOR CreatedOn

	--Rename Column
	exec sp_RENAME 'Employee.emp_id','Emp_ID','COLUMN'

	--Inserting Data In It
	INSERT INTO Employee(emp_id,fullName,Age,DOB,City,Phone,Gender,Aadhar,AccountNumber,Dept_ID,Salary,Designation,HireDate) Values(351,'Krunal Dhote',21,'2001-10-09','Amravati',9307871334,'Male','750109816681','968010110005769',1,5000,'.NET Developer','2023-02-06')











--TASK 2 :- Create store procedure INSERT, alter it and and execute

	--Create
	Create PROC sp_Insert
	@eid int,
	@fName varchar(100),
	@age int,
	@dob DATE,
	@city varchar(50),
	@phn BIGINT,
	@gender varchar(15),
	@aadhar char(12),
	@AcNo char(15),
	@dept_id int,
	@sal money,
	@des varchar(20),
	@hDt date,
	@crtOn DateTime
	AS
	BEGIN
		INSERT INTO EMPLOYEE(Emp_ID,fullName,Age,DOB,City,Phone,Gender,Aadhar,AccountNumber,Dept_ID,Salary,Designation,HireDate,CreatedOn) 
			VALUES(@eid,@fName,@age,@dob,@city,@phn,@gender,@aadhar,@AcNo,@dept_id,@sal,@des,@hDt,@crtOn)
		SELECT * FROM Employee
	END;

	--Alter
	Alter PROC sp_Insert
	@eid int,
	@fName varchar(100),
	@age int,
	@dob DATE,
	@city varchar(50),
	@phn BIGINT,
	@gender varchar(15),
	@aadhar char(12),
	@AcNo char(15),
	@dept_id int,
	@sal money,
	@des varchar(20),
	@hDt date
	AS
	BEGIN
		INSERT INTO EMPLOYEE(Emp_ID,fullName,Age,DOB,City,Phone,Gender,Aadhar,AccountNumber,Dept_ID,Salary,Designation,HireDate) 
			VALUES(@eid,@fName,@age,@dob,@city,@phn,@gender,@aadhar,@AcNo,@dept_id,@sal,@des,@hDt)
		SELECT * FROM Employee
	END;

	--Execute
	EXEC sp_Insert 11,'Krunal',21,'2001-10-09','Warud','8734907890','Male','129069120826','333696613476',3,'5000','.NET Developer','2023-02-06'