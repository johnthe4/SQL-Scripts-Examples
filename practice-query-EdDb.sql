Select * from Major
	where MinSAT >= 1000
	order by MinSAT desc;

-- slide 78
select * from Student
	where SAT < 1000
	order by sat desc;

-- slide 79
select Lastname, Firstname, YearsExperience from Instructor
	order by Lastname;

-- join will not bring students with null foreign key 
select s.Lastname as 'Students Last Name', m.Description as 'Major'
	from Student s
	join Major m
		on s.MajorId = m.Id;

-- to join student with class, need to connect StudentClass table
-- 3rd table can join on either 1st or 2nd
-- can see table relationship on slide 60
select s.Lastname as 'Name', c.Subject, c.Code 
from Student s
	join StudentClass sC
		on sc.StudentId = s.Id
	join Class c
		on sc.ClassId = c.Id
	where s.Lastname = 'Ant';
		
-- another example as above
select *
	from Student s
	join StudentClass sC
		on sc.StudentId = s.Id
	join Class c
		on sc.ClassId = c.Id
	where c.Code Like 'ENG%';

-- another example using MajorClass to connect Major and Class
Select m.Description as 'Major', c.Code, c.Subject
	from Major m
	join MajorClass mC
		on m.Id = mc.MajorId
	join Class c
		on c.id = mc.ClassId
		where m.Description = 'General Business';

-- LEFT JOIN
SELECT * 
	from Student s 
	left join Major m				-- will join all of database student, even if foreign key is null
		on m.Id = s.MajorId;

SELECT * 
	from Student s 
	right join Major m				-- will join all of major student, even if foreign key is null
		on m.Id = s.MajorId;

-- slide 94
-- gives all classes, even without instructors		
Select * 
	from Class c
	left join Instructor i 
		on c.InstructorId = i.id
	order by i.Lastname;

-- gives instructors without classes
Select * 
	from Class c
	right join Instructor i 
		on c.InstructorId = i.id
	where c.InstructorId is null
	order by i.Lastname;

-- SUBQUERY EX.
-- can use SELECT statement to define another SELECT statement
Select * from Student s 
	where GPA >= (select AVG(gpa) from Student);


Select * 
	from Student s
	left join Major m 
		on s.MajorId = m.Id;

-- parameterized Query slide 102
-- must declare variable outside of the query
declare @sat int;							-- must declare variable with @
set @sat = 1495;
select *
	from Student s
	where sat >= @sat
	order by sat desc;

declare @lowGPA decimal(7,2) = 2.25;
declare @highGPA decimal(7,2) = 3.59;
select * 
	from Student
	where GPA >= @lowGPA AND GPA <= @highGPA
	order by GPA desc;

-- aggregate functions slide 109
-- COUNT function
select statecode as 'State', COUNT(*) as 'Number of Students'
	from Student
	group by StateCode								-- used group by to count amount of students in each group
	order by COUNT(*) DESC;

-- MAX function
-- needs to be used in a subquery
select *
	from Student
	where GPA = (select MAX(gpa) from Student);

-- CONCAT combines multiple tables into 1 string
select CONCAT(Lastname,', ', Firstname) as 'name', GPA, SAT
	from Student
	order by Lastname;

-- FORMAT can change the format of a table to show currency
-- IN SALESDB
select name, FORMAT(sales, 'C')
	from customers;

-- ISNULL - will change null to a specified string
select CONCAT(s.firstname, ' ', s.Lastname) as 'Name', ISNULL(Description, 'Undeclared') as 'Major'
	from Student s
	left join Major m
		on s.MajorId = m.Id
	order by s.Lastname;
