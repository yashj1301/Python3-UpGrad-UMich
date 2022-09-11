#Describing a DataFrame

df = pd.read_csv('https://query.data.world/s/vBDCsoHCytUSLKkLvq851k2b8JOCkF.csv')
print(df.describe())
print(df.columns)
print(df.shape)