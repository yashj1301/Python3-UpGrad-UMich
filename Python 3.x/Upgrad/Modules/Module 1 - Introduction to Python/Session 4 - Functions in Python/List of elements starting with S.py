import ast,sys
input_str = sys.stdin.read()
input_list = ast.literal_eval(input_str)

count=len(list(filter(lambda x: x[0]=='S' or x[0]=='s',input_list)))
print(count)