n=int(input())

arr=np.zeros([n,n],dtype=int)
arr[[0,-1]]=np.ones(n)
arr[:,0]=np.ones(n)
arr[:,-1]=np.ones(n)
print(arr)