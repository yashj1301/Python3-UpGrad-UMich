import pandas as pd
df = pd.read_csv('https://github.com/yashj1301/Python3-UpGrad-UMich/raw/master/Python%203.x/Upgrad/Modules/Module%203%20-%20Python%20for%20Data%20Science/Session%203%20-%20Pandas/Data/forestfires.csv')
df_2 =df[(df['area']>0) & (df['wind']>1) & (df['temp']>15)]
print(df_2.head(20))
