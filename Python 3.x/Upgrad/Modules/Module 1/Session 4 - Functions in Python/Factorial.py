from functools import reduce

n=int(input('Enter the number:'));

if n<0:
    print('Error ! Out of scope');
        
elif n==0:
    return 1;
    
else:
    fact=reduce(lambda x,y: x*y,list(range(1,n+1)))
        
print('{}!={}'.format(n,fact));
