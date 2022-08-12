astr = ‘Hello Bob’;

try:
	istr = int(astr); # this will throw traceback error with IF-ELSE
except:
	istr=-1;
print(‘First:’,istr);
 
astr = ‘123’;
try:
	istr = int(istr);
except:
	istr=-1;
print(‘Second:’,istr);
