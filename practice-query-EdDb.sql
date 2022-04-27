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

