# Finding out the profession from a dictionary having a list as a value

import ast,sys
input_str = sys.stdin.read()
input_dict = ast.literal_eval(input_str)

#Type you answer here
profession=input_dict[104][-1]

print(profession)
