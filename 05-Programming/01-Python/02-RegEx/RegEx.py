import re

# straight away we use regex to sort of sanitize input and perform error handling making sure the operator provided is functional for the code
pattern = r'^[\+\-\*/]$'
def is_valid_operator(input_var):
    return bool(re.match(pattern, input_var))


def calculate():
    a = input("Enter your first number:  ")
    b = input("Enter another:  ")
    c = input("Enter one of the following symbols according to the operation you want to perform +,-,*,/ :")

    
    if not is_valid_operator(c):
        print("Operator not valid, only use +(plus), -(minus), *(multiply) or /(divide)")
        # exits program after printing message above
        return

    try:
        num1 = int(a)
        num2 = int(b)
        operator = c

        if operator == "+":
            res = num1 + num2
        elif operator == "-":
            res = num1 - num2
        elif operator == "*":
            res = num1 * num2
        elif operator == "/":
            res = num1 / num2

        print("Result is:")
        print(res)

    # And here it catches the error and executes the planed piece of code 
    except:
        print("Something went wrong...")


calculate()