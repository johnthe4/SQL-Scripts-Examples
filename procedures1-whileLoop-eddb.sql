-- procedures
-- this creates the procedure counter
create or alter procedure Counter
	@max int = 5					-- do not declare variable in procedure BEFORE as
as 
-- BEGIN/END are statement blocks, code is run between statement blocks
begin
	declare @nbr int = 0;
	declare @sum int = 0
	while @nbr <= @max
	begin
		set @sum = @sum + square(@nbr);
		print str(@nbr) + ' sum of the squares ' + trim(str(@sum));
		set @nbr +=  + 1;
	end
	print 'Done...'
end

-- go will 'lock in the db', then can execute
go 
exec Counter @max = 10;				-- can pass values of variables during exec
