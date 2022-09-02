import ast
lis=ast.literal_eval(input('enter the list:'))

d={i:lis.count(i) for i in lis}
print()
print(list(d.keys()))

#using the sorted() and the set() functions

# sorted(set(lis),key=lis.index)