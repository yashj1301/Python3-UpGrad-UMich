score=input('enter score:');

try:
    score=float(score);
    
    if score>=0.0 and score<=1.0:
        if score>=0.9: print('A');
        elif score>=0.8: print('B');
        elif score>=0.7: print('C');
        elif score>=0.6: print('D');
        else: print('F');
    
    else:
        print('Error ! Score out of range. Please enter a score between 0 and 1.');
        #quit();

except: print('Error ! Please enter numeric value.');