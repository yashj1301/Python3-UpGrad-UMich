print("Welcome to our bank ") 
p=int(input("Enter your 4 digit pin number: ")) 
m=25000 
if(p == 1234): 
    print("1-Withdraw Cash") 
    print("2-Balance Enquiry") 
    print("3-Change ATM Pin")
    print("4-Exit")
    
    c = int(input("Please choose transactions: ")) 
    
    if(c == 1): 
        w=int(input("Enter withdraw amount: ")) 
        if (w < m and w%100 == 0): print("Please take your amount:", w) 
        else: print("Invalid cash") 
    
    elif(c==2): print("Your available amount : ",m) 
    elif (c==3): 
        print("Your current ATM Pin is: ",p);
        p=int(input("Enter new ATM Pin: "));
        print("Pin Updated Successfully.");
        
    else: 
        print("Exiting Now.")
        exit();
        
else: print("Wrong pin number")