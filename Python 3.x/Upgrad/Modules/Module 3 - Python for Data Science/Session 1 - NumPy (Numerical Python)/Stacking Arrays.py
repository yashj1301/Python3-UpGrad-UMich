a1=np.array([[7, 13, 14], [18, 10, 17], [11, 12, 19]])
a2=np.array([16, 6, 1])
a3=np.array([[5, 8, 4, 3]])

fin=np.hstack((np.vstack((a1,a2)),a3.transpose()))
print(fin)