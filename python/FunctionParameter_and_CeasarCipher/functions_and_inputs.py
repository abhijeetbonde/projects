def greet():
    print("Hello")
    print("How are you?")
    print("Today is Awesome!!!")

greet()
print("###########################################")

#Argument
def greet_param(name):
    print(f"Hello {name}")
    print(f"How are you, {name}")
    print(f"Today is Awesome, right, {name}")

greet_param("Abhi")

print("")

#Positional Arguments
def greet_multi_param(name, location):
    print(f"Hey, {name}")
    print(f"What is it like it in {location}?")

greet_multi_param("Abhi", "India")
print("")

#Keyword Arguments
greet_multi_param(location="London", name="Pushkar")