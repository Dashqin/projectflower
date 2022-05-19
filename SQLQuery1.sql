

--create database branch
--use branch
--create table Worker(
--Id int primary key identity,
--name nvarchar(15),
--surname nvarchar(15),
--positionId int,
--Salary money
--)
--insert into worker values ('Babil','Babayev',1,450),('Akif','Resulov',2,500),('Elshad','Ceferov',3,650)


--create table Pozition(
--id int primary key identity,
--name nvarchar(15)
--)
--insert into Pozition values ('Kassir'),('Komekchi'),('Temirchi')


--create table Branch(
--id int primary key identity,
--name nvarchar(15)
--)
--insert into Branch values ('Yasamal'),('Sahil'),('Bakixanov')
--create table Praduct(
--id int primary key identity,
--name nvarchar(15),
--buyingPriace money,
--sellingPriace money
--)
--insert into Praduct values ('GalaxyJ1',200,250),('S5',400,500),('A51',700,800)
--create table Selling(
--id int primary key identity,
--PraductId int references Praduct(Id),
--WorkerId int references Worker(Id),
--SellingTime datetime,
--BranchId int references Branch(Id)
--)
--insert into Selling values (1,1,'04.05.2018',1),(2,2,'02.04.2013',2),(3,3,'05.03.2016',3)

--select Worker.Name 'IshChiAdi',Praduct.Name 'ProductADi',Branch.Name 'FlialAdi',Praduct.buyingPriace,Praduct.sellingPriace from Selling 
--join Worker on Worker.Id=Selling.WorkerId
--join Praduct on Praduct.Id=Selling.PraductId 
--join Branch on Branch.Id=Selling.BranchId


-------------------------------------------------------------------------------------Personal

create database Earth
use Earth


create table City(
Id int primary key identity,
Name nvarchar(25) not null,
Population int,
long decimal,
lat decimal
)

create table Country(
Id int primary key identity,
Name nvarchar(25) not null,
PresidentName nvarchar(15),
CityId int references City(Id)
)

--create view Connecting as select * from Country

Create view Connecting as 
Select City.Name 'Sheher',Country.Name 'Country' from Country join City on Country.CityId=City.Id

select * from Connecting

create procedure  precedur @group
as 


--------------------------------------------------------ClassWork


select * from Students
join Groups on Students.GroupId = Groups.Id


select * from Lessons
join Groups on Lessons.GroupId = Groups.Id
join Teachers on Lessons.TeacherId = Teachers.Id
join Students on Students.GroupId = Groups.Id

Create table Alumni(
	Id int Primary Key Identity,
	Name nvarchar(200),
	Age int,
	GroupId int,
	AverageScore int
)
select Name from Students
union
select Name from Alumni

select Name from Students
union all
select Name from Alumni

select Name, Age from Alumni
except
select Name, Age from Students

select Name, Age from Alumni
intersect
select Name, Age from Students

alter view GetEmployeeInfo
as
Select w.Name,w.Surname,w.Job,w.Salary,d.Name 'Department', m.Name +' '+ m.Surname 'Manager'
from Workers as w
Left Join Departments as d on w.DepartmentId = d.Id
Left Join Managers as m on d.ManagerId = m.Id

select * from GetEmployeeInfo



alter table Students add GraduationStatus nvarchar(100)

create procedure UpdateStudentStatus
as
update Students set GraduationStatus = 'Success' where AverageScore>60
update Students set GraduationStatus = 'Failed' where AverageScore<=60

exec UpdateStudentStatus



create procedure DeleteStudentByMinScore @Score int
as
Delete from Students where AverageScore < @Score



exec DeleteStudentByMinScore 20

exec DeleteStudentByMinScore 10


create procedure GetStudentInfoByMinGradeAndName (@Name nvarchar(100), @Grade int = 0)
as
select * from Students where Name = @Name AND AverageScore>@Grade

exec GetStudentInfoByMinGradeAndName 'Mamed', 70




Country - Name, PresidentName ve City - Name, Population, lon. , lat. tableleri olsun 
Relational
City ve olkeleri birlesdiren view yazin
Olke qebul edib seherlerini cixaran prosedur yazin	

create table Countries(
	Id int primary key identity,
	Name nvarchar(100), 
	President nvarchar(100), 
)
create table Cities(
	Id int primary key identity,
	Name nvarchar(100), 
	Population int,
	CountryId int references Countries(Id)
)



create view CityInfo
as
select Cities.Name 'City Name', Cities.Population 'City Population', Countries.Name 'Country Name' from Cities
Join Countries on Cities.CountryId = Countries.Id


select * from CityInfo

alter procedure GetCitiesOfCountry @CountryName nvarchar(100)
as 
select Name from Cities where CountryId = (Select Id from Countries where Lower(Name) = Lower(@CountryName))

exec GetCitiesOfCountry 'GeRManY'


create function GetStudentCountByMinGrade(@Grade int)
returns int as
begin
	declare @Result int
	select @Result = Count(*) from Students where AverageScore > @Grade
	return @Result
end


select dbo.GetStudentCountByMinGrade(90)


alter table Groups add StudentCount int



create trigger StudentCreated
on Students
after insert
as
begin 
	Update Groups set StudentCount = StudentCount + 1
	where Id = (select GroupId from inserted Students) 
end


create trigger StudentDeleted
on Students
after delete
as
begin 
	Update Groups set StudentCount = StudentCount - 1
	where Id = (select GroupId from deleted Students) 
end


-----------------------

create database FilmSector
use FilmSector

create table Actors(
Id int primary key identity,
Name nvarchar(45) not null,
Surname nvarchar(45) not null,
Age int not null,
)
insert into Actors values ('Elshad',19),('Ezi',24),('Refi',22),('Eldar',25)
create table Genres(
Id int primary key,
Name nvarchar(45) not null
)
insert into Genres values ('Romance'),('Romantic'),('Fantastic'),('fullgenre')

create table Films(
Id int primary key identity,
Name nvarchar(45) not null,
ReleaseDate date not null,
Raiting float not null
)
insert into Films values ('KurtlarVadisi','04.05.2004',9),('LaCasaDePapel','05.09.2017',7.8),('Destan','02.06.2021',8),('GameOfThrones','02.06.2011',9)
create table FilmtoActors(
Id int primary key identity,
FilmId int references Films(Id),
ActorId int references Actors(Id)
)
insert into FilmtoActors values (1,2),(3,2),(2,1)

create table FilmToGenres(
Id int primary key identity,
FilmId int references Films(Id),
GenreId int references Genres(Id)
)

insert into FilmtoGenres values (1,1),(2,2),(1,3)


select Films.Name  from FilmtoActors join Films on Films.Id=FilmtoActors.FilmId