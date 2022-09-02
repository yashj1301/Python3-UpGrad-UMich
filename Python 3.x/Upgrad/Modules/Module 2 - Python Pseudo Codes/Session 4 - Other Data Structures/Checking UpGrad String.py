string=list(input('enter string: ')) # changing to list
count_dict={i:string.count(i) for i in string} # creating a dictionary that has count of each character as values

val_list=list(sorted(count_dict.values())) # creating a sorted list of the values in the dictionary
sorted_dict=dict(sorted(count_dict.items(),key=lambda key: key[1])) # creating a sorted dictionary on the basis of values

# creating a difference set which returns all the unique values as the difference of each element in the values list. Since our
# sequence needs to be 1,2,3,4,5...... the set will always return {1} for all true strings. 

diff_set= set([val_list[i+1] - val_list[i] for i in range(len(val_list)-1)])

# creating a flag variable that will contain the value True or False
flag= True if diff_set=={1} and val_list[0]==1 else False

print('\n',flag)