import random

#Choose a word randomly
word_list = ["abhijeet", "pushkar", "dua", "kabir", "shruti", "daku"]
chosen_word = random.choice(word_list)
print(chosen_word)

# Create place holder with same number of blanks as in chosen_word
placeholder = ""
for position in range(len(chosen_word)):
    placeholder += "_"
print(placeholder)


##GAME --
lives = 6
correct_letter = []
game_over = False

while not game_over:
    display = ""

    guess = input("Guess a letter: ").lower()

    if guess in correct_letter:
        print("You have already Guessed this letter, wont loose a life")

    for letter in chosen_word:
        if letter == guess:
            display += letter
            correct_letter.append(guess)
        elif letter in correct_letter:
            display += letter
        else:
            display += "_"

    print(display)

    if guess not in chosen_word:
        lives -= 1
        print("You lost a life")
        if lives == 0:
            game_over = True
            print("No lives left")

    if display == chosen_word:
        game_over = True
        print("###YOU WIN!!!####")

