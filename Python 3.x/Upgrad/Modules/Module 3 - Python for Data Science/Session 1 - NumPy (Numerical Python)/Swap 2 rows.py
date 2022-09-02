import numpy as np 

# Given array
a = np.array([[4, 3, 1], [5, 7, 0], [9, 9, 3], [8, 2, 4]])

# Read the values of m and n
import sys
lines = sys.stdin.readlines()
m = int(lines[0])
n = int(lines[1])

# Write your code for swapping here
temp=a[m].copy()
a[m]=a[n]
a[n]=temp
# Print the array after swapping
print(a)