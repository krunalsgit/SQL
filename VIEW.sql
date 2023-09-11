use KrunalDhote351

CREATE View EmpView
AS 
	SELECT * FROM EMPLOYEES

SELECT * FROM EmpView

CREATE VIEW SomeEmpView 
As
	SELECT * FROM EMPLOYEES WHERE LastName LIKE 'D%'

SELECT * FROM SomeEmpView

Create View EmpOrd
As
	SELECT E.* FROM EMPLOYEES E
	left Join Orders O ON O.EmployeeID=E.EmployeeID
	WHERE O.EmployeeID IS NULL

SELECT * FROM EmpOrd

Drop VIEW EmpOrd