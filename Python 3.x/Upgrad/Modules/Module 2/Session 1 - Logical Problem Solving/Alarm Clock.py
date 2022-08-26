def time(day,bval):
    ring='';
    if (bval==True and day in range(1,6)) or (bval==False and day not in range(1,6)) : ring='10:00'
    elif (bval==False and day in range(1,6)): ring='7:00'
    else: ring='off'
    return ring

time(7,True)
