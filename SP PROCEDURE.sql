USE KrunalDhote351 


--SELCT PROCEDURE
ALTER PROC sp_Show
@table nvarchar(20)
AS
BEGIN
    declare @run nvarchar(max);
	set @run= 'SELECT * FROM ' + quotename(@table)
	exec sp_executesql @run
END;
EXEC sp_Show Employee

--DROP PROCEDURE
CREATE PROC sp_Drop
@table nvarchar(20)
AS
BEGIN
	declare @run nvarchar(max);
	set @run='DROP TABLE '+ QUOTENAME(@table)
	exec sp_executesql @run
END


--DELETE PROCEDURE WITH ID
ALTER PROC sp_DeleteById
	@id int
	AS
	BEGIN
		DELETE FROM Employee WHERE Emp_ID=@id;
		SELECT * FROM Employee
	END

--EXECURTE BOTH AT A TIME
DECLARE @id int SET @id=10
EXEC sp_DeleteById @id



--INSERT PROCEDURE
sp_helptext sp_Insert
ALTER PROC sp_Insert
	@fName varchar(100),
	@age int,
	@dob DATE,
	@phn BIGINT,
	@gender varchar(15),
	@aadhar char(12),
	@AcNo char(15),
	@dept_id int,
	@sal money,
	@des varchar(20),
	@hDt date,
	@cID int
	AS
	BEGIN
		INSERT INTO EMPLOYEE(fullName,Age,DOB,Phone,Gender,Aadhar,AccountNumber,Dept_ID,Salary,Designation,HireDate,cID) 
			VALUES(@fName,@age,@dob,@phn,@gender,@aadhar,@AcNo,@dept_id,@sal,@des,@hDt,@cID)
		SELECT * FROM Employee
	END;


EXEC sp_Insert 'Kane Williumson',21,'2001-10-09','8757907890','Male','129066650826','3355666676',3,'5000','Cricketer','2023-02-06',NULL


--InserUpdate Procedure Education
	ALTER PROC sp_InsertUpdate
	@fName varchar(100),
	@age int,
	@dob DATE,
	@phn BIGINT,
	@gender varchar(15),
	@aadhar char(12),
	@AcNo char(15),
	@dept_id int,
	@sal money,
	@des varchar(20),
	@hDt date,
	@cID int,
	@eid int=NULL
	AS
	BEGIN
		IF(@eid IS NULL)
		BEGIN
			INSERT INTO EMPLOYEE(fullName,Age,DOB,Phone,Gender,Aadhar,AccountNumber,Dept_ID,Salary,Designation,HireDate,cID) 
				VALUES(@fName,@age,@dob,@phn,@gender,@aadhar,@AcNo,@dept_id,@sal,@des,@hDt,@cID)

		END
		ELSE
		BEGIN
			BEGIN TRAN
			UPDATE Employee
				SET fullName=@fName,
					Age=@age,
					DOB=@dob,
					Phone=@phn, 
					Gender=@gender,
					Aadhar=@aadhar, 
					AccountNumber=@AcNo, 
					Dept_ID=@dept_id,
					Salary=@sal, 
					Designation=@des, 
					HireDate=@hDt, 
					cID=@cID
				WHERE Emp_ID=@eid
			COMMIT TRAN
	
		END
		SELECT * FROM Employee	
	END

EXEC sp_InsertUpdate 'Sandeep Lodhi',21,'2001-10-09','8757907111','Male','329066111126','51166676',3,'5000','.NET DEVELOPER','2023-02-06',103
