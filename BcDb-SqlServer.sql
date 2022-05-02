use master;
go
drop database if exists BcDb;
go
create database BcDb;
go
use BcDb;
go

create table Customers
(
	ID int primary key identity(1,1) not null,
	code varchar(10) not null unique,
	name varchar(30) not null,
	sales decimal(9,2) not null default(0) check (Sales >= 0),
	active bit not null default(1),
	created datetime not null default getdate()
)

insert Customers
	(code, name, sales)
	VALUES
	('TQL', 'Total Quality Logistics', 500000);

select * from Customers;
