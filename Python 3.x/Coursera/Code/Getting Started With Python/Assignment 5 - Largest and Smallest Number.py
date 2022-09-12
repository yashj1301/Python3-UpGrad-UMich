largest = None
smallest = None
while True:
    num = input("Enter a number: ")
    if num == "done":break
    try:
        num=int(num)
        if largest is None: largest=num
        elif num > largest: largest=num
        
        if smallest is None: smallest=num
        elif num<smallest: smallest=num
            
    except: 
        print('Invalid Input')
        continue

print("Maximum is", largest)
print("Minimum is",smallest)