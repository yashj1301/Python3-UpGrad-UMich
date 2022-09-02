# Read the input list
import ast,sys
input_str = sys.stdin.read()
input_list = ast.literal_eval(input_str)

import numpy as np

# Convert the input list to a NumPy array
array_2d =np.array(input_list)

# Extract the first column, first row, last column and last row respectively using
# appropriate indexing
col_first = array_2d[:,0]
row_first = array_2d[0]
col_last = array_2d[:,-1]
row_last = array_2d[-1]

print(col_first)
print(row_first)
print(col_last)
print(row_last)