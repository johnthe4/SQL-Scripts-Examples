-- Procedure to add new Major
create or alter procedure AddMajor
	--variables needed to insert majore
	@code varchar(4) = null,
	@description varchar(50) = null,
	@minsat int = null

as
begin
	-- make sure variables aren't empty
	if @code is null
	begin
		print 'Code cannot be empty';
		return;
	end
	if @description is null
	begin
		print 'Description cannot be empty';
		return;
	end
	if @minsat is null
	begin
		print 'Minimum SAT cannot be empty';
		return;
	end

	-- insert into table
	insert Major (code, Description, MinSAT)
		values (@code, @description, @minsat)

	-- check to confirm table altered correctly
	if @@ROWCOUNT != 1
	begin
		print 'Process failed';
		return;
	end

	print 'Added to Major';
end

go 
exec AddMajor @code = 'SPAN', @description = 'Spanish', @minsat = 1000;

go
select * from Major
	ORDER by id desc;
