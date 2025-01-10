def substract():
    a = input("Enter a number to substract from:  ")
    b = input("Enter a number to be substracted:  ")

    # Here we initiate the try block just before performing computing tasks that could go wrong (if a the wronf data type is provided) 
    try:
        num1 = int(a)
        num2 = int(b)
        res = num1 - num2
        print("Result is:")
        print(res)

    # And here it catches the error and executes the planed piece of code 
    except:
        print("Something went wrong...")


substract()