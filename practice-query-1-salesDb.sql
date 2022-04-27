SELECT * FROM Customers;

SELECT * FROM Customers 
	WHERE City = 'cincinnati' 
	order by Name;

SELECT Name, City, State, Sales, Active FROM Customers;

SELECT * FROM Customers 
	order by City, Sales desc;

SELECT * FROM Customers 
	WHERE city = 'cleveland' AND Sales >= '50000' 
	order by Sales;

select * From Customers 
	where (City = 'cincinnati' and Sales > 30000)
	or (city = 'columbus' and Sales > 35000)
	or (City = 'cleveland' and Sales < 10000);

select * from Customers
	where city != 'cincinnati'; 
--  where not (city = 'cincinnati';
--  either way works for SQL, != more recognized in programming

select * from Customers
	where not (City = 'cleveland' or City = 'columbus');

-- same as city = 'cleveland' or city = 'columbus
select * from Customers
	where City in ('cleveland','columbus');

SELECT * FROM OrderLines;

SELECT * FROM Orders;

-- joining 2 tables
select o.Id, c.Name, o.Date, o.Description		-- gives all columns from Orders, Name column from Customers
	from Orders o								-- o and c are aliases for Orders and Customers
	join Customers c
		on o.CustomerId = c.Id;

-- group by, count function
select c.Name 'Customers', COUNT(*) as 'Orders'		-- '' after column names will name the display column
	from Customers c
	join Orders o
		on o.CustomerId = c.Id
	group by c.Name
	order by Orders desc;
