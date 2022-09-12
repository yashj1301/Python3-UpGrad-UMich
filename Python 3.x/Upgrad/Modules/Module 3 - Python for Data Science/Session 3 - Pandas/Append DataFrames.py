# Suppressing warnings
import warnings
warnings.simplefilter("ignore")

import pandas as pd
df_1 = pd.read_csv('https://github.com/yashj1301/Python3-UpGrad-UMich/raw/master/Python%203.x/Upgrad/Modules/Module%203%20-%20Python%20for%20Data%20Science/Session%203%20-%20Pandas/Data/restaurant-1.csv')
df_2 = pd.read_csv('https://github.com/yashj1301/Python3-UpGrad-UMich/raw/master/Python%203.x/Upgrad/Modules/Module%203%20-%20Python%20for%20Data%20Science/Session%203%20-%20Pandas/Data/restaurant-2.csv')
df_3 =pd.concat([df_1,df_2])

print(df_3.head())