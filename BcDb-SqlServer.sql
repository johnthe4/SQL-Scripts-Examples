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

create table salesOrder
(
	ID int primary key identity(1,1) not null,
	Description varchar(80) not null,
	Date DateTime not null default getdate(),
	total decimal(9,2) not null default 0,
	CustomerID int foreign key references customers(ID) not null
)

insert Customers
	(code, name, sales)
	VALUES
	('TQL', 'Total Quality Logistics', 500000);

insert salesOrder 
	(Description, total, CustomerID)
	VALUES
	('1st slsord', 1000, (select id from Customers where code like '%TQL%'));

select * from Customers;
select * from salesOrder;

-- view we created
select * from customerSalesOrder;
