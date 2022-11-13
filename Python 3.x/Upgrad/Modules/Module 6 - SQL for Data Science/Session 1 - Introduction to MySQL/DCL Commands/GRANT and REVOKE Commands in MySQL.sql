
use test;

#creating a user 
create user 'test'@'%' identified by 'test';

#checking current priveleges
show grants for test;

#granting privileges to user
grant select,insert,update on persons to test;
show grants for test;

#revoking privileges from user
revoke update,insert on persons from test;
show grants for test;

#showing user names
use mysql;
select User,Host from user;

#deleting user
drop user test;
select User,Host from user;

