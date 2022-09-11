# Creating a panda series having squares
n = int(input())
sq=pd.Series({i+1:(i+1)**2 for i in range(n)})
sq