n=int(input())
from functools import reduce
answer=[[1]]
for i in range(1, n+1):
    t=[i]*((2*i)-3)
    answer.insert(0, t)
    answer.append(t)
    for a in answer:
      a.insert(0,i)
      a.append(i)

for a in answer:
    print(reduce(lambda x,y: str(x)+str(y),a))