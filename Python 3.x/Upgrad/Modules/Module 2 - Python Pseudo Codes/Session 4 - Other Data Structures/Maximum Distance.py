l1=[1, 2, 3, 2, 5, 1, 2, 4, 6, 2, 7, 8, 6]

l_dis={}
pos=[]

for i in l1:
  pos=[]
  for j in range(len(l1)):
    if l1[j]==i:
      pos+=[j]
      l_dis[i]=pos

dis_dict={i:max(l_dis[i])-min(l_dis[i]) for i in l_dis}
print(max(dis_dict.values()))