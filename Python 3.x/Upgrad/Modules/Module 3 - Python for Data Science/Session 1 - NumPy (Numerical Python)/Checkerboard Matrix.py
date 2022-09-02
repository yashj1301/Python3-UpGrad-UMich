n=int(input('enter the number'))
print()
if n%2!=0:
    print('error')
else:
    n=int(n/2);
    print(np.tile([[0,1],[1,0]]*n,n))