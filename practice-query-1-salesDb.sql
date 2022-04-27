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
	where City = 'cincinnati' and Sales > 30000 
	order by Sales;

SELECT * FROM OrderLines;

SELECT * FROM Orders;

