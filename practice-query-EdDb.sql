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

