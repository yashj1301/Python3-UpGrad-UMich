
use test;

#using CASE clause to create a dynamic column
select name,year_enroll,course_id,case
    
    when year_enroll >= 2022 then 'Phase I'
    when year_enroll between 2019 and 2021 then 'Phase II'
    when year_enroll between 2016 and 2018 then 'Phase III'
    else 'Phase X'
end as 'Phase'
from student limit 5;

#using case clause with other clauses
select first_name,dob,gender,blood_group from persons order by 
(case 
    when dob is null then gender
    when dob between '1800-01-01' and '1899-12-31' then blood_group
    when dob between '1900-01-01' and '1999-12-31' then first_name
    else dob 
end);

