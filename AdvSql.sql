use KrunalDhote351

create table Demo(
	Id int,
	Name varchar(200)
	primary key(Id,Name),
	Age int check(Age>0)
)

Insert Into Demo Values(9,'Krunal',21),(5,'Harshit',21),(2,'Piyush',22),(4,'Sandhya',21)

create clustered index IX_Demo_Age on Demo(Age asc)
--Cannot create more than one clustered index on table 'Demo'. Drop the existing clustered index 'PK__Demo__5523B448929B6DFF' before creating another.

drop Index Demo.PK__Demo__5523B448929B6DFF
--An explicit DROP INDEX is not allowed on index 'Demo.PK__Demo__5523B448929B6DFF'. It is being used for PRIMARY KEY constraint enforcement.
Alter Table Demo
drop constraint PK__Demo__5523B448929B6DFF

--
create clustered index IX_Demo_Age on Demo(Age asc,Name asc)

drop index Demo.IX_Demo_Age

Alter Table Demo
Add primary key(Id)

Demo

create nonclustered index IXNON_DEMO_Name
on Demo(Name)

create nonclustered index IXNON_DEMO_Age
on Demo(Age)

sp_Helpindex Demo


--Fire Trigger After Some Command
create or alter trigger tr_Demo_forInsert
on Demo
after insert 
as
begin
	Select * From inserted
end

insert into demo values(8,'Gayu',18)

create table DemoInfo(
	Id int primary key identity(1,1),
	Info varchar(250),
	DemoId int references Demo(Id)
)

create or alter trigger tr_Demo_CreteInfoOnInsert
on Demo
after insert
as
begin
	Declare @id int
	Declare @name varchar(100)
	Select @id=Id,@name=Name From inserted
	Insert into DemoInfo Values('The new entry registered as Name ' + Cast(@name as varchar(100)) + ' having Id ' + Cast(@id as varchar(10)) + ' on Date ' + Cast(GETDATE() as varchar(50)),@id);
end
--DROP TRIGGER DEMO.tr_Demo_CreteInfoOnInsert
insert into demo values('Kunal',21)

create or alter trigger tr_Demo_InsteadOfInsert
on Demo
instead of insert
as
begin
	Select * From Demo
end

insert into demo values('Bhaskar',21)  -- Can't insert any data 


drop trigger demo.tr_Demo_InsteadOfInsert