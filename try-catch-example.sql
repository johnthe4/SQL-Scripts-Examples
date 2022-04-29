-- Try .. Catch
begin try
	throw 1230000, 'idx is 5', 1;
end try
begin catch
	select 
	ERROR_NUMBER() as 'Error Num',
	ERROR_MESSAGE() as 'Error Message',
	ERROR_STATE() as 'Error State';
end catch