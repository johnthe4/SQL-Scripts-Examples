alter table customers
	alter column name varchar(50) not null;

alter table customers
	add updated DateTime default null;