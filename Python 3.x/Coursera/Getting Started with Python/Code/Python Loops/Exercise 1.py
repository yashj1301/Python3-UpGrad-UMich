tot=0
count=0
while True:
    num=input('enter a number:')
    if num=='done': break
    try:
        num=float(num)
        tot=tot+num
        count=count+1
        num=num+1
    except: print('bad data')
print(tot,count,tot/count)
    