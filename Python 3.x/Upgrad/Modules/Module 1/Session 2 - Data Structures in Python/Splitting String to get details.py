# Splitting an input string to get first name, last name, and employee id

input_str=input('Enter your input: ');

first_name=input_str.split('_')[1];
last_name=input_str.split('_')[0];
employee_id=input_str.split('_')[2];

print('First name: ',first_name)
print('Last name: ',last_name)
print('Employee Id: ',employee_id)