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

-- joining more than 2 tables
-- 3rd table can join on either 1st or 2nd
select s.Lastname as 'Name', c.Subject, c.Code from Student s
	join StudentClass sC
		on sc.StudentId = s.Id
	join Class c
		on sc.ClassId = c.Id
	where s.Lastname = 'Ant';
		
