import ast,sys
input_str = sys.stdin.read()
side = ast.literal_eval(input_str)#list of side lengths

if side[1]<=side[0] or side[-2]<=side[-1]:
    print('Possible')
else:
    print('Impossible')