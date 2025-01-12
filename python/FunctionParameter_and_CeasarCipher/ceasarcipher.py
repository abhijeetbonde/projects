alphabets = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

#### SECTION 1 - Create 2 seperate functions for encode and decode -->

direction = input("Type 'encode' to encrypt and 'decode' to decrypt: \n")
text = input("Type your message : \n").lower()
shift = int(input("Type the shift number: \n"))

#Create a funstion - encode that takes original text and shifts by shift number that can handle spaces in messages
def encode(text, shift_number):
    encoded_message = ""
    for letter in text:
        if letter == " ":
            new_letter = " "
            encoded_message += " "
        else:
            new_index = alphabets.index(letter) + shift
            if new_index > 25:                              #To help z shift even after alphabet list ends
                new_index = new_index % len(alphabets)
            new_letter = alphabets[new_index]
            encoded_message += new_letter
    print(f"Encoded Msg is :{encoded_message}")

#create a function that cant handle spaces
def decode(text, shift_amount):
    decoded_message = ""
    for letter in text:
        new_index = alphabets.index(letter) - shift
        new_index = new_index % len(alphabets)          # Another way to modulo shift
        new_letter = alphabets[new_index]
        decoded_message += new_letter
    print(f"Decoded msg is : {decoded_message}")

# if direction == "encode":
#     encode(text, shift)
# else:
#     decode(text, shift)

##################################################################################

#### SECTION 2 - Create 1 function that handles encode variable -->

#Create a function ceasar - that handles encoding or decoding in a single function:
def ceasar(text, shift_amount, action):
    message = " "
    for letter in text:
        if letter == " ":
            new_letter = " "
            message += " "
        else:
            if action == "encode":
                new_index = alphabets.index(letter) + shift
            else:
                new_index = alphabets.index(letter) - shift
            new_index = new_index % len(alphabets)  # Another way to modulo shift
            new_letter = alphabets[new_index]
            message += new_letter
    print(f"The {action}d message is : {message}")


ceasar(text, shift, direction)