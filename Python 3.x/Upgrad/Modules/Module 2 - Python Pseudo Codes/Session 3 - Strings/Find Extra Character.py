#take input on your own
str1=input()
str2=input()

#write code to find the extra character here
extra=[str1[i] for i in range(len(str1)) if str1.count(str1[i])!=str2.count(str1[i])] if len(str1)>len(str2) else [str2[i] for i in range(len(str2)) if str2.count(str2[i])!=str1.count(str2[i])]

for i in set(extra):print(i)