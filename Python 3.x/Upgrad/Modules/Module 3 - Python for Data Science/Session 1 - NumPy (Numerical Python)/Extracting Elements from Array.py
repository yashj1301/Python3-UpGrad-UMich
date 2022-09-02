#take input here
import ast 
input_list=ast.literal_eval(input())
m=int(input())
n=int(input())

import numpy as np
array_1 = np.array(input_list)
final_array = np.array([i for i in array_1 if i>m and i<n])

print(final_array)

