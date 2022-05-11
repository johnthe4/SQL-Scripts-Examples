use master;
go
drop database if exists PigDice
go
create database PigDice
go
use PigDice
go

Create table HighScores
(Id int primary key identity(1,1) not null,
	HighScore int not null,
	GamesPlayed BIGint not null,
	Date DateTime not null default getdate()
);

select * from HighScores order by id desc;
