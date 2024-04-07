create table Countries(
[Id] int primary key identity (1,1),
[Name] nvarchar (50)
)

insert into Countries ([Name])
values('Azerbaycan'),
      ('Turkiye'),
	  ('Rusiya')




create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar (50),
[CountryId] int,
foreign key ([CountryId]) references Countries(Id)
)


create procedure usp_createCity
@name nvarchar (50),
@countyId int
as
begin
insert into Cities([Name],[CountryId])
values(@name,@countyId)
end

exec usp_createCity 'Tumen',3


select * from Countries
select * from Cities


create table Students(
[Id] int primary key identity (1,1),
[Name] nvarchar (50),
[SurName] nvarchar (50),
[Address] nvarchar (100),
[Age] int,
[Email] nvarchar(100),
[CityId] int
)

select * from Cities

create procedure usp_createstudent
@name nvarchar (50),
@surname nvarchar(50),
@address nvarchar(50),
@age int,
@email nvarchar (100),
@cityId int
as
begin
insert into Students([Name],[SurName],[Address],[Age],[Email],[CityId])
values(@name,@surname,@address,@age,@email,@cityId)
end
exec usp_createstudent 'Hacixan','Hacixanov','Zaqatala',21,'hacixan@gmail.com',1


select * from Countries
select * from Cities
select * from Students
select * from Groups
select * from StudentGroups

create table StudentGroups(
[Id] int primary key identity (1,1),
[StudentId] int,
[GroupId] int
)

create procedure usp_createstudentgroups
@studentid int,
@groupid int
as
begin
insert into StudentGroups([StudentId],[GroupId])
values(@studentid,@groupid)
end
exec usp_createstudentgroups 1,1


create table Teachers(
[Id] int primary key identity (1,1),
[FullName] nvarchar (50),
[Salary] int,
[Address] nvarchar (100),
[Email] nvarchar(100),
)


create procedure usp_createteacher
@fullname nvarchar (50),
@salary int,
@address nvarchar(50),
@email nvarchar (100)
as
begin
insert into Teachers([FullName],[Salary],[Address],[Email])
values(@fullname,@salary,@address,@email)
end
exec usp_createteacher 'Cavid Basirov',13500,'Ehmedli','cavid@gmail.com'

select * from Groups
select * from Teachers
select * from GroupTeachers


create table GroupTeachers(
[Id] int primary key identity (1,1),
[GroupId] int,
[TeacherId] int
)

create procedure usp_creategroupstudents
@groupid int,
@teacherid int
as
begin
insert into GroupTeachers([GroupId],[TeacherId])
values(@groupid,@teacherid)
end
exec usp_creategroupstudents 4.3

select * from Countries
select * from Cities
select * from Students
select * from Groups
select * from StudentGroups
select * from Teachers
select * from GroupTeachers
select * from Rooms


create table Rooms(
[Id] int primary key identity (1,1),
[Capacity] int
)

create procedure usp_createrooms
@capacity int
as
begin
insert into Rooms([Capacity])
values(@capacity)
end
exec usp_createrooms 27