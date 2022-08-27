inp={'Fruit': 1, 'Vegetable': {'Cabbage': 2, 'Cauliflower': 3}, 'Spices': 4}
new={}
for i in inp:
  if type(inp[i])==dict:
    for j in inp[i]:
      new[i+'_'+j]=inp[i][j]
  else:
    new[i]=inp[i]

print(sorted(new.keys()))
print(sorted(new.values()))