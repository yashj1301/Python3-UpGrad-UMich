def calc(operator):
    n1=int(input("Enter the first number: "));
    n2=int(input("Enter the second number: "));
    
    if operator=='+':res=n1+n2
    elif operator=='-':res=n1-n2
    elif operator=='*':res=n1*n2
    elif operator=='/':res=n1/n2
    elif operator=='//':res=n1//n2
    elif operator=='%':res=n1%n2
    elif operator=='**':res=n1**n2
    else: 
        print('\nWrong Operator');
    
    return res;

print("=============================")
print("Welcome to our Calculator")
print("=============================")

print("1. Addition (+)")
print("2. Subtraction (-)")
print("3. Multiplication (*)")
print("4. Division (/)")
print("5. Floor Division (//)")
print("6. Modulus (%)")
print("7. Power (**)")

print("-------------------------------")
op=input("Please enter your operation: ")
print('The answer is {}'.format(calc(op)))