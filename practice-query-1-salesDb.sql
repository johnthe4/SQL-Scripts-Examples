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

