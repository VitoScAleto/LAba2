def zadanie3_21():
    size = int(input("Введите количество чисел для ввода:\n"))
    number = []
    for i in range(size):
        input_number = int(input(f"Введите {i + 1} число:\n"))
        number.append(input_number)
    for i in range(size):
        if number[i] >= 0:
            a = number[i]
            sum_val = 0
            mult = 1
            while a > 0:
                b = a % 10
                sum_val += b
                mult *= b
                a = a // 10
            if sum_val < mult:
                print(f"Index number = {i}")

def zadanie1_1():
    while True:
        counter_null = 1
        S = input("Input string:\n")
        for i in range(len(S)):
            if S[i] == '0' and S[i + 1] == '0':
                counter_null += 1
            if i < len(S) - 1 and S[i + 1] == '1' and S[i] == '0':
                if i - counter_null >= 0 and S[i - counter_null] == '1' and S[i - counter_null + 1] == '0':
                    print(S[i - counter_null:i - counter_null + counter_null + 2])
                    counter_null = 1
        print("Input string:")

def zadanie2_1():
    RomanNumeral = {1: "I", 5: "V", 10: "X", 50: "L", 100: "C", 500: "D", 1000: "M", 10000: "Q"}
    RomanNumeralReverse = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000, "Q": 10000}
    number = input("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)\nEnter roman number:\n")
    if not is_valid_roman_numeral(number, RomanNumeral, RomanNumeralReverse):
        print("Error roman number\n")
    elif is_valid_roman_numeral(number, RomanNumeral, RomanNumeralReverse):
        print(f"Arabian number = {translation(number, RomanNumeralReverse)}")

def is_valid_roman_numeral(roman_number, roman_numeral, roman_numeral_reverse):
    counter_for_two = 0
    for i in range(len(roman_number)):
        is_valid_counter = 0
        for value in roman_numeral.values():
            if roman_number[i] == value:
                is_valid_counter += 1
                break
        if is_valid_counter == 0:
            return False
    for i in range(len(roman_number) - 1):
        if (roman_number[i] == roman_numeral[5] and roman_number[i + 1] == roman_numeral[5]) or \
           (roman_number[i] == roman_numeral[50] and roman_number[i + 1] == roman_numeral[50]) or \
           (roman_number[i] == roman_numeral[500] and roman_number[i + 1] == roman_numeral[500]):
            counter_for_two += 1
        if counter_for_two > 0:
            return False
        repeat_count_three_times = 0
        for j in range(len(roman_number)):
            if roman_number[i] == roman_number[j]:
                repeat_count_three_times += 1
            else:
                break
        if repeat_count_three_times > 3:
            return False
    return True

def translation(roman_number, roman_numeral_reverse):
    total = 0
    prev_value = 0
    for i in range(len(roman_number) - 1, -1, -1):
        value = roman_numeral_reverse[roman_number[i]]
        if value < prev_value:
            total -= value
        else:
            total += value
        prev_value = value
    return total

while True:
    choice = input("Input Zadanie number\n1 - Zadanie1_1\n2 - Zadanie2_1\n3 - Zadanie3_21\nEnter number: ")
    if choice == '3':
        zadanie3_21()
    elif choice == '2':
        zadanie2_1()
    elif choice == '1':
        zadanie1_1()
    else:
        print("Error")
