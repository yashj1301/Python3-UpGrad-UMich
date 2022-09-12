x=10;
if x>5:
	print(‘greater than or equal to 5’);
	if x<10:
		print(‘between 5 and 10’);
		print(‘less than 5 and greater than 10’);
	elif x==10:
		print(‘equal to 10’);
	else:
		print(‘greater than 10’);
		print(‘greater than 5 and 10’);
elif x==5:
	print(‘equal to 5’);
else:
	print(‘less than 5’);
