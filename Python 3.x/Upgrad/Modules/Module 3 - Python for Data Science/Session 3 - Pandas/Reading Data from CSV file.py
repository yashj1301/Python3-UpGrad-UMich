#Reading data from CSV file

name='https://media-doselect.s3.amazonaws.com/generic/A08MajL8qN4rq72EpVJbAP1Rw/marks_1.csv'

# Provide your answer below
cols=['Name','Subject','Maximum Marks','Marks Obtained','Percentage']
df =pd.read_csv(name,sep='|',header=None,index_col=0)
df.columns=cols
df.index.name='S.No.'
print(df)