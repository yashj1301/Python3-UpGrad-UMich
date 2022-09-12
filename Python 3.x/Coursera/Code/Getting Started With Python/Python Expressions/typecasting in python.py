x = 3;
	y = 3.3;
	z = 1;
	a = ‘ABC’;
	b = ‘123’;
	c = False;
 
	int(y) 				# this is allowed – will show 3
	float(x) 			# this is allowed – will show 3.0
	str(z) 	    			# this is allowed – will show ‘1’
	bool(z)	    			# this is allowed – will show True
	int(a), float(a) 	# this is not allowed
	float(b) 			# this is allowed
	int(c), float(c)		# this is allowed – will show 0 and 0.0
	bool(a) 				# this is not allowed
