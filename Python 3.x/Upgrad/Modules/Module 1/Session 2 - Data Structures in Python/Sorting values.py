# sorting values in a dictionary

import ast,sys
input_str = sys.stdin.read()
input_dict = ast.literal_eval(input_str)

#type your answer here
list=sorted(input_dict.values());
print(list);