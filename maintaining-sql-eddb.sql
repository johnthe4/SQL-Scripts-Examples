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
