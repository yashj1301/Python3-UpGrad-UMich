#Title case lists

input_list=['list1','LIST2','LIsT3','lISt4'];
tc_list=[];
for i in input_list:
    tc_list+=[i[0].upper()+i[1:].lower()];
print(tc_list)
    