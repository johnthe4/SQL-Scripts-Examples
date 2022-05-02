-- create db Music
use master;
go
drop database if exists Music;
go
create database Music;
go
use Music;
go

Create table artist
(
	ID int primary key identity(1,1),
	name varchar(100) not null,
	genre varchar(100) not null
)

Create table Album
(
	ID int primary key identity(1,1),
	Title varchar(100) not null,
	artistID int Foreign key references artist(ID) not null
)

Create table Song
(
	ID int primary key identity(1,1),
	name varchar(100) not null,
	aristID int Foreign key references artist(ID) not null,
	albumID int Foreign key references album(id) not null
)

Insert artist
	(name, genre)
	VALUES
	('Taylor Swift', 'Country/Pop'),
	('Kid Cudi', 'Rap');

insert Album
	(Title, artistID)
	VALUES
	('Fearless', (select ID from artist where name like '%Taylor Swift%')),
	('Folklore', (select ID from artist where name like '%Taylor Swift%')),
	('Man on the Moon: The End of Day', (select ID from artist where name like '%Kid Cudi%')),
	('Man on the Moon 2: The Legend of Mr Rager', (select ID from artist where name like '%Kid Cudi%'));

insert Song
	(name, aristID, albumID)
	VALUES
	('Fearless', (select ID from artist where name like '%Taylor Swift%'), (select ID from Album where title like '%Fearless%')),
	('Love Story', (select ID from artist where name like '%Taylor Swift%'), (select ID from Album where title like '%Fearless%')),
	('Cardigan', (select ID from artist where name like '%Taylor Swift%'), (select ID from Album where title like '%Folklore%')),
	('Seven', (select ID from artist where name like '%Taylor Swift%'), (select ID from Album where title like '%Folklore%')),
	('Soundtrack 2 My Life', (select ID from artist where name like '%Kid Cudi%'), (select ID from Album where title like '%Man on the Moon: The End%')),
	('Day ''n'' Nite (Nightmare)', (select ID from artist where name like '%Kid Cudi%'), (select ID from Album where title like '%Man on the Moon: The End%')),
	('Pursuit of Happiness', (select ID from artist where name like '%Kid Cudi%'), (select ID from Album where title like '%Man on the Moon: The End%')),
	('Mr. Rager', (select ID from artist where name like '%Kid Cudi%'), (select ID from Album where title like '%Man on the Moon 2: The Legend of%')),
	('Mojo So Dope', (select ID from artist where name like '%Kid Cudi%'), (select ID from Album where title like '%Man on the Moon 2: The Legend of%'));
	
select s.ID as 'Song ID', s.name as 'Song Name', s.aristID as 'Songs Artist ID', s.albumID as 'Songs album ID',
		al.ID as 'Album ID', al.Title as 'Album Name', al.artistID as 'Albums artist',
		ar.ID as 'Artist ID', ar.name as 'Artist Name', ar.genre as 'Artist Genre'
		from Song s
	join Album al 
		on s.albumID = al.ID
	join artist ar
		on s.aristID = ar.ID;
