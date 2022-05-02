--PRS DB
use master;
go
drop database if exists PRS
go
create database PRS
go
use PRS
go

create table Users
	(Id int primary key identity(1,1) not null,
	Username varchar(30) not null unique,
	password varchar(30) not null,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	Phone varchar(12),
	eEmail varchar(255),
	IsReviewer bit default 0 not null,
	IsAdmin bit default 0 not null)

insert into Users
	(Username, password, Firstname, Lastname, phone, eEmail, IsReviewer, IsAdmin)
	VALUES
	('JMcGaughey', 'SharksAreCool', 'John', 'McGaughey', null, 'jmcgaughey@company.com', 1, 1),
	('KSmith', 'Ninjas', 'Kurt', 'Smith', null, 'ksmith@company.com', 1, 0),
	('TLee', 'Hello!', 'Thomas', 'Lee', null, null, 0, 0);

create table Vendors
	(Id int primary key identity(1,1) not null,
	Code varchar(30) not null unique,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State Varchar(2) not null,
	Zip varchar(5) not null,
	Phone varchar(12),
	Email varchar(255));

insert into vendors	
	(code, Name, Address, City, State, Zip, Phone, Email)
	VALUES
	('BestBuy001', 'Best Buy', '650 Eastgate S Dr', 'Cincinnati', 'OH', '45245', null, null),
	('OfficeDepot001', 'Office Depot', '4540 Eastgate Blvd', 'Cincinnati', 'OH', '45245', null, null);

create table Products
	(Id int primary key identity(1,1) not null,
	PartNbr varchar(30) not null unique,
	Name varchar(30) not null,
	Price decimal(9,2) default 0 not null,
	unit varchar(30) default 'Each' not null,
	PhotoPath varchar(255),						-- path to image
	VendorId int foreign key references Vendors(Id) not null);

insert into Products
	(PartNbr, Name, Price, unit, PhotoPath, VendorId)
	VALUES
	('PG-2 10001', 'Pilot G-2 Retractable Pens', 13.19, 'Each', null, (select id from Vendors where Code like '%OfficeDepot001%')),
	('725844', 'Office Depot Spiral Notebook', 2.89, 'Each', null, (select id from Vendors where Code like '%OfficeDepot001%')),
	('8978655', 'LG 24MP400 Borderless Monitor', 149.99, 'Each', null, (select id from Vendors where Code like '%OfficeDepot001%')),
	('6360418', 'Logitech - 2S Wireless Mouse', 59.99, 'Each', null, (select id from Vendors where Code like '%BestBuy001%')),
	('7536034', 'Mouse Pad with Foam Wrist Rest', 14.99, 'Each', null, (select id from Vendors where Code like '%BestBuy001%'));

create table Requests
	(Id int primary key identity(1,1) not null,
	Description varchar(80) not null,
	Justification varchar(80) not null,
	RejectionReason varchar(80),
	DeliveryMode varchar(20) not null,
	Status varchar(10) default 'NEW' not null,
	Total decimal(11,2) default 0 not null,
	UserId int foreign key references Users(Id) not null);

create table requestlines
	(Id int primary key identity(1,1) not null,
	RequestId int foreign key references requests(Id) not null,
	ProductId int foreign key references Products(Id) not null,
	Quantity int default 1 not null);

select * from Users;
Select * from Vendors v 
	join Products p
		on v.id = p.VendorId;
