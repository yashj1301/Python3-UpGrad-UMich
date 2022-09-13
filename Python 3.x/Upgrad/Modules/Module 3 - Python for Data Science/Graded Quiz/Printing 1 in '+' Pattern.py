# Read the input
n = int(input())

# Import the NumPy package
import numpy as np 

# Write your code here
if n%2!=0:
  arr=np.zeros((n,n),dtype=int)
  arr[n//2]=np.ones(n)
  arr[:,n//2]=np.ones(n,dtype=int)
  print(arr)


