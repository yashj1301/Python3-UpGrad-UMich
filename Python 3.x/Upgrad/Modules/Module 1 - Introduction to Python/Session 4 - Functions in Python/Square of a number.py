import ast,sys
input_str = sys.stdin.read()
input_list = ast.literal_eval(input_str)
x = int(input_list[0])
y = int(input_list[1])

def squared(x,y):
    return x**y;

print(squared(x,y))