-- declare/deallocate cursor
declare aCursor Cursor for
	select * from major;

-- declare variables we are getting from row
declare @id int, @code varchar(4), @desc varchar(50), @minsat int;	
Declare @sum int = 0, @count int = 0, @avg int = 0;					-- variables to find average of MinSat

--need to OPEN/CLOSE cursor
open aCursor;

-- get first row
FETCH Next FROM  aCursor into @id, @code, @desc, @minsat;
	
-- fetch and print remainder of rows
while @@FETCH_STATUS = 0
begin
	print 'Major: ' + trim(str(@id)) + ' | ' + @code + ' | ' + @desc + ' | ' + trim(str(@minsat));
	-- calculating total sum and count of MinSat row
	set @sum += @minsat;
	set @count += 1;

	FETCH Next FROM  aCursor into @id, @code, @desc, @minsat;
end

-- calculate and print average
set @avg = @sum / @count;
print 'Average Minimum SAT ' + trim(str(@avg));
print 'Done...';

close aCursor; 
deallocate aCursor;
-- check to make sure above avg is correct
select avg(minsat) as 'Average Minimum SAT' from Major;