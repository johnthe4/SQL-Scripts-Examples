-- creating view
CREATE or ALTER VIEW CustomerSalesOrder as
select so.id as 'Order ID', so.description as 'Order Description', so.date as 'Order Date', so.total as 'Order Total', c.name as 'Customer Name'
	from salesOrder so
	join Customers c 
		on c.ID = so.CustomerID;

select * from CustomerSalesOrder;
