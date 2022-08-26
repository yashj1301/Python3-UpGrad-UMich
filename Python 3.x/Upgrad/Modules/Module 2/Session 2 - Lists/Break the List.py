# Read the input list
import ast
input_str = input()
input_list = ast.literal_eval(input_str)

# Write your code here
reverse=sorted(set(input_list))[-1::-1]
k=reverse[0]
for i in reverse:
    if i==k:k='not present'
    else: k=reverse[1]
print(k)