# Adding element Python to an input tuple 

input_str=input('Enter your input in a comma-separated way: ');
input_list=input_str.split(',')+['Python'];

tuple2=tuple(input_list);
print('The final tuple is: ',tuple2);
