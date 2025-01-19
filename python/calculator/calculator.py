def addition(n1, n2):
    return n1 + n2

def multiplication(n1, n2):
    return n1 * n2

def division(n1, n2):
    return n1/n2

def substraction(n1, n2):
    return n1 - n2

operations = {
    "+": addition,
    "-": substraction,
    "*": multiplication,
    "/": division
}

def calculator():
    num1 = float(input("Please enter first number: "))
    should_accumulate = True
    while should_accumulate:
        for symbol in operations:
            print(symbol)
        operation_symbol = input("What operation would you like to do? ")
        num2 = float(input("Please enter second number: "))
        answer= operations[operation_symbol](num1, num2)
        print(f"Calculation result : {answer}")
        choice = input(f"Type y to continue with {answer}, or type n to start a new calculation : ")
        if choice == "y":
            num1 = answer
        elif choice == "n":
            should_accumulate = False
            print("Thank you for using the Calculator app")
            print("\n" * 10)
            calculator()        #This is important to keep the calculator app running for new calculations

calculator()