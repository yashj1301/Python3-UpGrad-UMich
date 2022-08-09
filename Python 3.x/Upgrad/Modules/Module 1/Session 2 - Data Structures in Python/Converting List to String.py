# Converting an input list to string

input_str=input('Enter your list (in comma separated): ');
input_list=input_str.split(',');

new_str=input_list[0]+'&'+input_list[1];

new_str