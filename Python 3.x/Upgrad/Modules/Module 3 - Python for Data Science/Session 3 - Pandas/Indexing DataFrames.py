import pandas as pd
df = pd.read_csv('https://raw.githubusercontent.com/yashj1301/Python3-UpGrad-UMich/master/Python%203.x/Upgrad/Modules/Module%203%20-%20Python%20for%20Data%20Science/Session%203%20-%20Pandas/Data/forestfires.csv')
df_2 =df.iloc[2::2]
print(df_2.head(20))