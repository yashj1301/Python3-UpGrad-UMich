import ast,sys
input_str = sys.stdin.read()
input_list = ast.literal_eval(input_str)
first_name = input_list[0]
last_name = input_list[1]

name = list(map(lambda i: first_name[i]+" "+last_name[i],range(len(first_name))))

print(name)