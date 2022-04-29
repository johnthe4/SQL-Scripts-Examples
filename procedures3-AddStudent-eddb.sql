-- Procedure to add student to EdDb
CREATE or ALTER procedure AddStudent
	@firstname varchar(30) = null,
	@lastname varchar(30) = null,
	@statecode char(2) = 'OH',
	@sat int = null,
	@gpa decimal(4,2) = 0,
	@majorcode varchar(4) = null
as
begin
	-- make sure fields aren't null
	if @firstname is null
	begin
		print 'First name is required';
		return;
	end
	if @lastname is null
	begin
		print 'Last name is required';
		return;
	end
	
	-- find majorid using users code
	declare @majorID int = 0;
	select @majorID = id from Major where code = @majorcode;

	-- check to see if major was found 
	if @majorID = 0
	begin
		print 'Major not found';
		return;
	end

	insert Student (Firstname, Lastname, StateCode, SAT, gpa, MajorId)
		values (@firstname, @lastname, @statecode, @sat, @gpa, @majorid);

	-- check to make sure 1 row was added
	if @@ROWCOUNT != 1
	begin
		print 'Insert failed';
		return;
	end
	
	print 'Insert successful!';
end
go
exec AddStudent @firstname = 'Jacob', @lastname = 'McGaughey', @statecode = 'KY', 
				@sat = 1200, @gpa = 3.7, @majorcode = 'FIN';
go
select * 
	from Student s
	join major m
		on s.MajorId = m.Id
	order by s.id desc;
