  create table Employees(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50) not null,
  [Surname] nvarchar (50),
  [Age] int check (Age >= 18)
)
create procedure usp_createemploye
@name nvarchar(50),
@surname nvarchar(50),
@age int

as
begin
  insert into Employees([Name],[Surname],[Age])
  values (@name,@surname,@age)
end
exec usp_createemploye 'Eldar','Agayev',21

create procedure usp_createStudent
@name nvarchar(50),
@surname nvarchar(50),
@age int,
@email nvarchar(100),
@address nvarchar (50)

as
begin
  insert into Students([Name],[Surname],[Age],[Email],[Address])
  values (@name,@surname,@age,@email,@address)
end
exec usp_createStudent 'Nazim','Hesenli',26,'nazim@gmail.com','Bineqedi'


select * from Employees

select * from Students


select * from Employees
union
select * from Students

select * from Employees
union all
select * from Students

 
select [Age] from Employees
union all
select [Age] from Students


select [Name],[Age] from Employees
union all
select [Name],[Age] from Students



--intersect
--except


select * from Employees
intersect
select * from Students


select * from Employees
except
select * from Students 


select COUNT(*)as 'Student count',Age
FROM Students
GROUP BY Age;


declare @num1 int = 50;

declare @num2 int =30;

if @num1>@num2
  
    print 'Yes'

else

    print 'No'

select * from Employees
select * from Students


create function dbo.getEmployeesAvgAge()
returns int
as
begin
    return (select AVG(Age)from Employees)
end


create procedure usp_checkStudentsAndEmployeesAvgAges
@studentAvgAge int,
@teacherAvgAge int
as
begin
    if @studentAvgAge>@teacherAvgAge
	    print 'Student average age is bigger than teachers average ages'

	else
	    print 'Student average age is not bigger than teachers average ages'

end

declare @stuAvgAge int=select dbo.getStudentsAvgAge()
declare @empAvgAge int=select dbo.getEmployeesAvgAge()


exec usp_checkStudentsAndEmployeesAvgAges @stuAvgAge,@empAvgAge


Declare @Counter int
set @Counter=1
WHILE(@Counter <=10)
begin
     print 'The counter value is='+ CONVERT(nvarchar,@counter)
	 set @counter =@counter + 1
end