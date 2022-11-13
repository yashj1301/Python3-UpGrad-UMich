
use test;

#searching for string starting with r
select * from player where name rlike '^r';

#searching for string ending with a
select * from player where name rlike 'a$';

#searching for string containing ar
select * from player where name rlike 'ar';

#searching for string starting with either r or v
select * from player where name rlike "^[rv]";

#searching for string ending with either i or a
select * from player where name rlike '[ia]$';

#searching for string having either of ar,ra,ri
select * from player where name rlike 'ra|ri|ar';

#searching for strings containing letters from v to y
select * from player where name rlike '[v-y]';

#searching for values containing numbers from 3 to 8
select * from player where jersey_no rlike '[3-8]';

#searching for strings containing either of u,p,y
select * from player where name rlike '[upy]';

#searching for strings having punctuations 
select * from player where role rlike '[:punct:]';

#searching for strings having exactly 14 or 8 characters
select * from player where name rlike '^.{14}$|^.{8}$';

#searching for strings having between 12 to 14 characters
select * from player where name rlike '^.{12,14}$';

#searching for strings having minimum 12 characters
select * from player where name rlike '^.{12}';

