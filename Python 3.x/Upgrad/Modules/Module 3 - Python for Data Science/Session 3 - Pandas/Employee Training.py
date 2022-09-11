import numpy as np
import pandas as pd

# The file is stored at the following path:
#'https://media-doselect.s3.amazonaws.com/generic/NMgEjwkAEGGQZBoNYGr9Ld7w0/rating.csv'
df = pd.read_csv('https://media-doselect.s3.amazonaws.com/generic/NMgEjwkAEGGQZBoNYGr9Ld7w0/rating.csv')

# Provide your answer below
df['Training']=df['Rating'].apply(lambda x: 'Yes' if x<=3.5 else 'No')
print(df[:5])