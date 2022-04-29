-- procedures for
create or alter procedure ShowCustomersBySalesRange
	@lowsales decimal(10,2) = 0.0,
	@highsales decimal(10,2) = 99999999.99
as
begin
select *
	from Customers
	where Sales between @lowsales and @highsales
	order by sales desc;
end
go
exec ShowCustomersBySalesRange @lowsales = 50000;
