-- TRANSACTIONS
begin transaction;

update major set 
	Description = 'To be deleted' 
	where id = 8;

select * from Major;

rollback;						-- this will revert the changes to description
