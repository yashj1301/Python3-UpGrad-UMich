hrs = input("Enter Hours:");

try: 
    h = float(hrs);
    rate = input('Enter the rate per hour:');
    try: 
        r=float(rate);
        if h<=40: pay=r*h;
        else: pay=(r*40)+r*(h-40)*1.5;
        print('\nGross Pay:',pay,'$');
    except:
        print('Error ! Please enter numeric input');
    
except:
    print('Error ! Please enter numeric input');
    