class user:
    def __init__(self,name,age,friend_list):
        self.name=name;
        self.age=age;
        self.friend_list=friend_list;

yash=user('Yash',22,['Albert','Max','Marie','Erwin'])
elon=user('Elon',50,['Max','Josh','Robert','Marie','Louis','Erwin','Vladimir'])

mutual_friends=list(set(yash.friend_list).intersection(set(elon.friend_list)))
print('Mutual Friends of {} and {} are {}'.format(yash.name,elon.name,mutual_friends))