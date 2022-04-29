-- DELETE STATEMENT
DELETE 
	FROM Student
	WHERE SAT <=900;

-- UPDATE statement
update Student set
	GPA = GPA - 0.1
	where MajorId = (select id from Major where Description like '%Math%');

update Student set
	GPA = GPA + 0.1
	where majorid = (select id from Major where Description like '%Math%');

select * 
	from Student
	where majorid = (select id from Major where Description like '%Math%');

-- INSERT statement
INSERT Student															-- primary cant be listed if sql generates it 
	(Firstname, Lastname, StateCode, SAT, GPA, MajorId)					-- SAT/MajorId can be null 
	VALUES
	('John', 'McGaughey', 'KY', '1250', '2.8', '7'),
	('Justin', 'McGaughey', 'KY', '1000', '3.2', null);

DELETE from Student
	Where Lastname like ('%McGaughey%');

select Firstname as 'First Name', Lastname as 'Last Name', StateCode as 'State', sat,	gpa, Description as 'Major' 
	from Student s
	join major m
		on s.MajorId = m.Id
	where Lastname like ('%McG%');

UPDATE Student set
	MajorId = (select id from Major where Description like ('%Education%'))
	where Lastname like ('%McG%');

-- Create Major Underwater Basket Weaving
insert Major 
	(Code, Description, MinSAT)
	VALUES
	('BSKT', 'Underwater Basket Weaving', 12);

Select * from Major
	order by Description;

-- remove major Finance, put all students in Finance into the Chad Major Underwater Basket Weaving
update Student set
	MajorId = (select id from Major where code = 'BSKT')
	where MajorId = (select id from Major where Description like ('%General Studies%'));

-- check all students now underwater
select Firstname as 'First Name', Lastname as 'Last Name', StateCode as 'State', sat,	gpa, Description as 'Major' 
	from Student s
	join major m
		on s.MajorId = m.Id
	WHERE s.MajorId = (select id from Major where Description like ('%Under%'));

-- delete major general studies
delete major
	where ID = (select id from Major where Description = 'General studies')

select * from major;

-- adding a student to a new class
insert class (code, subject, section)
	values
	('ENG401', 'English', 401);

select * from Class;
select * from Student;

select sc.StudentId, CONCAT(s.firstname, ' ', s.Lastname) as Name, c.code, c.subject, sc.ClassGradeValue as 'Grade', c.InstructorId as 'Instructor'
	from StudentClass SC
	JOIN Student S
		ON S.Id = sc.StudentId
	join Class c
		on c.Id = sc.ClassId;

insert StudentClass (StudentId, ClassId)
	values
	(
	(select id from Student where Lastname = 'McGaughey' and Firstname = 'John'), 
	(SELECT id from class where code = 'ENG401')
	);

