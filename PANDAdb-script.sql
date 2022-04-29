-- create Tables
use PANDA;

CREATE TABLE Department
(
	Id int PRIMARY KEY IDENTITY(1,1),
	Description varchar(60) not null,
	location varchar(80) not null
)

CREATE TABLE Employee 
(
	Id int PRIMARY KEY IDENTITY(1,1),
	firstName varchar(100) not null,
	lastName varchar(100) not null,
	email varchar(50) not null,
	phone varchar(12) not null,
	Salary decimal(9,2) not null default 0,
	active bit not null DEFAULT 1,
	DepartmentID int FOREIGN KEY references Department(Id)
)