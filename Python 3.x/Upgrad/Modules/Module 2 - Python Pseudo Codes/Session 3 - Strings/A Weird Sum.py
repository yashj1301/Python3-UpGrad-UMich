n=int(input())

add=sum(list(map(lambda x:int(x),[str(n)*i for i in range(1,n+1)])))

print(add)