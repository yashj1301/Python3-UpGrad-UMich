# Removing element named 'SPSS' from an input list

input_str=input('Enter your list (comma-separated): ');

input_list=input_str.split(',');

input_list.remove('SPSS');
new_list=input_list+['SPARK'];

print(new_list)