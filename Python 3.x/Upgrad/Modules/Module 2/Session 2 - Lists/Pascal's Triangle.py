n=int(input('enter nth row:'))

def fact(n):
    from functools import reduce
    n_list=[i for i in range(1,n+1)] if n>=0 else [i for i in range(n,0)]
    fact=reduce(lambda x,y: x*y,n_list) if n!=0 else 1
    
    return fact;

for i in range(n):
    pascal=[]
    for j in range(i+1):
        pascal+=[fact(i)//((fact(j)*fact(i-j)))]
        
print('\n',pascal)
print('\nPrinting triangle now.....')
print()
for i in range(n):
    for j in range(n-i):
        print(end=" ")
    for k in range(i+1):
        print(fact(i)//((fact(k)*fact(i-k))),end=' ')
    print()