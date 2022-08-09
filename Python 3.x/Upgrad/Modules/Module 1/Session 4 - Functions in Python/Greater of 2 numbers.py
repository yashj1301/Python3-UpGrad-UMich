import ast,sys
input_str = sys.stdin.read()
input_list = ast.literal_eval(input_str)
a = int(input_list[0])
b = int(input_list[1])

greater=lambda x,y: x if x>y else y;
print(greater(a,b))