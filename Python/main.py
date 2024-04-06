def zadanie1_1():
    numbers = [76, 24, 614, 14, 1153]
    for i in range(len(numbers)):
        if numbers[i] < 0:
            break
        a = numbers[i]
        sum_val = 0
        mult = 1
        while a > 0:
            b = a % 10
            sum_val += b
            mult *= b
            a = a // 10
        if sum_val < mult:
            print("Index number =", i)

def zadanie3_21():
    while True:
        counter_null = 1
        S = input("Enter the string: ")
        for i in range(len(S) - 1):
            if S[i] == '0' and S[i + 1] == '0':
                counter_null += 1
            if i < len(S) - 2 and S[i + 1] == '1' and S[i] == '0':
                if i - counter_null >= 0 and S[i - counter_null] == '1' and S[i - counter_null + 1] == '0':
                    print(S[i - counter_null:i - counter_null + counter_null + 2])
                    counter_null = 1

def zadanie2_1():
    roman_numeral = {1: 'I', 5: 'V', 10: 'X', 50: 'L', 100: 'C', 500: 'D', 1000: 'M', 10000: 'Q'}
    roman_numeral_reverse = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000, 'Q': 10000}
    while True:
        print("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
        number = input("Enter roman number: ")
        while not is_valid_roman_numeral(number, roman_numeral, roman_numeral_reverse):
            print("Error roman number")
            number = input("Enter roman number: ")
        print("Arabian number =", translation(number, roman_numeral_reverse))

def is_valid_roman_numeral(roman_number, roman_numeral, roman_numeral_reverse):
    counter_for_two = 0
    for i in range(len(roman_number)):
        is_valid_counter = 0
        for key, value in roman_numeral.items():
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
        for j in range(i, len(roman_number)):
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

if __name__ == "__main__":
    while True:
        print("Input Zadanie number")
        print("1 - Zadanie1_1")
        print("2 - Zadanie2_1")
        print("3 - Zadanie3_21")
        s = input("Enter number: ")
        if s == '3':
            zadanie3_21()
        elif s == '2':
            zadanie2_1()
        elif s == '1':
            zadanie1_1()
        else:
            print("Error")