import ast
inp=input()
inp_list=ast.literal_eval(inp)

string=list(inp_list[0])
step=inp_list[1]%26

char=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
char_caps=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

for i in range(len(string)):
    
    if string[i] in char:string[i]=char[char.index(string[i])-step]
    if string[i] in char_caps: string[i]=char_caps[char_caps.index(string[i])-step]

print(''.join(string))