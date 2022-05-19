create database spotify
use spotify

create table Artists(
Id int primary key identity,
Name nvarchar(45) not null
)
insert into Artists values ('Royce Da 5''9"'),('Eminem'),('Ed Sheeran'),('Young M.A'),
('White Gold'),('Juice WRLD'),('Skylar Grey'),('Black Though'),
('Q-Tip'),('Denaun'),('Anderson .Paak'),('Don Toliver'),
('KXNG Crooked'),('Joell Ortiz')
create table Albums(
Id int primary key identity,
Name nvarchar(70) not null
)
insert into Albums values ('Music To Be Murdered By - Side B (Deluxe Edition)'),('Music To Be Murdered By'),
('Kamikaze'),('Revival'),('The Marshall Mathers LP2(Deluxe)'),('Recovery(Delux Edition)'),
('Recovery'),('Relapse:Refill'),('Relapse[Deluxe]'),('Relapse'),
('Eminem Presents The Re-Up'),('Encore(Deluxe Version)'),
('The Eminem Show'),('The Marshall Mathers LP'),
('The Slim Shady LP(Expanded Edition)'),
('The Slim Shady LP')
create table Musics(
Id int primary key identity,
Name nvarchar(100) not null,
TotalSecond time not null,
ListenerCount int,
AlbumId int references Albums(Id)
)
insert into Musics values ('Premonition-Intro','2:53',55000,2),
('Unaccommodating(feat.Young M.A)','3:36',65000,2),
('You Gon'' Learn(feat.Royce Da 5''9"&White Gold)','3:54',1000000,2),
('Alfred-Interlude','0:30',250444,2),
('Those Kinda Nights(feat.Ed Sheeran)','2:57',659456,2),
('In Too Deep','3:14',4854544,2),
('Godzilla(feat.Juice WRLD)','3:30',784458,2),
('Darkness','5:37',10845789,2),
('Leaving Heaven(feat.Skylar Grey)','4:25',15045892,2),
('Yah Yah(feat.Royce Da 5''9",Black Thought,Q-Tip & Denaun)','4:46',485547,2),
('Stepdad-Intro','0:15',300045,2),
('Stepdad','3:33',80000,2),
('Marsh','3:20',2008672,2),
('Never Love Again','2:57',1515637,2),
('Little Engine','2:57',4568921,2),
('Lock It Up(feat.Anderson.Peak)','2:50',5289634,2),
('Farewell','4:07',5484464,2),
('No Regrets(feat.Don Toliver)','3:20',2540000,2),

('I Will(feat.KXNG Crooked,Royce Da 5''9"&Joell Ortiz)','5:03',6666666,2),
('Alfred-Outro','0:39',1362348,2)

create table AlbumToArtist(
Id int primary key identity,
AlbumId int references ALbums(Id),
ArtistId int references Artists(Id)
)
insert into AlbumToArtist values (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14)
create table ArtistToMusic(
Id int primary key identity,
ArtistId int references Artists(Id),
MusicId int references Musics(Id)
)
insert into ArtistToMusic values (2,1),(2,2),(4,2),(1,3),(5,3),(2,3),(2,4),
(3,5),(2,5),(2,6),(6,7),(2,7),(2,8),(2,9),(7,9),(2,10),(1,10),(8,10),
(9,10),(10,10),(2,11),(2,12),(2,13),(2,14),(2,15),(11,16),(2,16),
(2,17),(12,18),(2,18),(2,19),(1,19),(13,19),(14,19),(2,20)
-------Query 1
create view MusicInfo as
select Musics.Name 'Music',TotalSecond,Artists.Name 'Artist',Albums.Name 'Album'  from Musics 
join ArtistToMusic on ArtistToMusic.MusicId=Musics.Id
right join Artists on ArtistToMusic.ArtistId=Artists.Id
join Albums on Musics.AlbumId=Albums.Id
-------Query 2
create view AlbumInfo as
select Albums.Name 'Album',COUNT(Musics.Id) 'MusicCount' from Musics
join Albums on Musics.AlbumId=Albums.Id
group by Albums.Name
-------Query 3
create procedure Proced1 @listenerCount int and album nvarchar(100) as
select Musics.Name 'Music',ListenerCount from Musics where ListenerCount
join Albums on Musics.AlbumId=Albums.Id
-------Query 4
alter table Musics add IsDelete char(1)