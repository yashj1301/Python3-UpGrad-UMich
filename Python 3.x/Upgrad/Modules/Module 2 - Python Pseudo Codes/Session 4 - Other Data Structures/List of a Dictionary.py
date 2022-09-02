import ast
d1=ast.literal_eval(input('Enter the dictionary:'))

l=['{}_{}'.format(i,j) for i in d1 for j in d1[i]]
print()
print(l,end=' ')