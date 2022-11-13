
-- String Functions

select char_length('welcome to MySQL') 'num_chars',
length('Welcome to Python') 'bytes';

select concat('welcome','to','mysql') 'without delimiter',
concat_ws('_','welcome','to','mysql') 'with delimiter';

select format(2521434567.8763742,4) 'formatting',
insert('welcome_to_mysql',12,6,'Python') 'inserting substring';

select locate ('th','this is how this is done') 'no start',
locate ('th','this is how this is done',7) 'start at 7';

select lower('This is MySQL') 'Lowercase',
upper('This is MySQL') 'Uppercase';

select substr('The quick brown fox 
jumps over the little lazy dog',5,8) 'substring';

select '     TRUE   ' as 'String',ltrim('     TRUE   ') 'left trim',
rtrim('     TRUE   ') 'right trim',trim('     TRUE   ') 'trim';

select replace('     TRUE   ',' ','#') 'replace space with #',
reverse('mississippi') "reverse of 'mississippi'";

select left('Indian Cricket Team',5) 'first 5 characters',
right('Indian Cricket Team',5) 'last 5 characters';

select 'India' as str1, 'Indian' as str2, 
strcmp('India','Indian') 'comparison';

select field(5,4,5,3,4) "first position of number '5'";

