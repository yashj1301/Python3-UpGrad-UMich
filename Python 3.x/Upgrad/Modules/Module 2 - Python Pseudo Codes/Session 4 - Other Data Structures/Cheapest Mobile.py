#take input here
import ast

mob=ast.literal_eval(input())

#start writing your code here
for i in mob:
  if mob[i]==min(list(mob.values())): 
    print('{}: {}'.format(i,mob[i])) 
    break