import pandas as pd
df1 = pd.read_csv('https://github.com/yashj1301/Python3-UpGrad-UMich/raw/master/Python%203.x/Upgrad/Modules/Module%203%20-%20Python%20for%20Data%20Science/Session%203%20-%20Pandas/Data/restaurant-1.csv')
df2 = pd.read_csv('https://github.com/yashj1301/Python3-UpGrad-UMich/raw/master/Python%203.x/Upgrad/Modules/Module%203%20-%20Python%20for%20Data%20Science/Session%203%20-%20Pandas/Data/restaurant-2.csv')
df_3 = df1.merge(df2,on='unique_id',how='inner')
print(df_3.head(20))