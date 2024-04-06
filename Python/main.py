def Zadanie3_21():
    while True:
        counterNull = 1
        S = input("Enter the string:\n")
        for i in range(len(S)):
            if S[i:i+2] == "00":
                counterNull += 1
            if S[i+1:i+2] == "1" and S[i:i+1] == "0":
                if S[i-counterNull:i-counterNull+1] == "1" and S[i-counterNull+1:i-counterNull+2] == "0":
                    print(S[i-counterNull:i-counterNull+counterNull+2])
                    counterNull = 1
        S = ""

def Zadanie1_1():
    number = [76, 24, 614, 14, 1153]
    for i in range(len(number)):
        if number[i] < 0:
            break
        a = number[i]
        sum = 0
        mult = 1
        while a > 0:
            b = a % 10
            sum += b
            mult *= b
            a //= 10
        if sum < mult:
            print("Index number =", i)
            
def isValidRomanNumeral(romanNumber, RomanNumeral, RomanNumeralReverse):
    counterForTwo = 0
    for i in range(len(romanNumber)):
        isValidCounter = 0
        for j in range(len(RomanNumeral)):
            if romanNumber[i:i+1] == RomanNumeral[j]:
                isValidCounter += 1
                break
        if isValidCounter == 0:
            return False
    for i in range(len(romanNumber)):
        if romanNumber[i:i+1] == RomanNumeral[5] and romanNumber[i+1:i+2] == RomanNumeral[5]:
            counterForTwo += 1
        elif romanNumber[i:i+1] == RomanNumeral[50] and romanNumber[i+1:i+2] == RomanNumeral[50]:
            counterForTwo += 1
        elif romanNumber[i:i+1] == RomanNumeral[500] and romanNumber[i+1:i+2] == RomanNumeral[500]:
            counterForTwo += 1
        if counterForTwo > 0:
            return False
        repeatCountThreeTimes = 0
        for j in range(len(romanNumber)):
            if romanNumber[i:i+1] == romanNumber[j:j+1]:
                repeatCountThreeTimes += 1
            else:
                break
        if repeatCountThreeTimes > 3:
            return False
    return True

def translation(romanNumber, RomanNumeralReverse):
    total = 0
    prevValue = 0
    for i in range(len(romanNumber)-1, -1, -1):
        value = RomanNumeralReverse[romanNumber[i:i+1]]
        if value < prevValue:
            total -= value
        else:
            total += value
        prevValue = value
    return total

def Zadanie2_1():
    RomanNumeral = {1: "I", 5: "V", 10: "X", 50: "L", 100: "C", 500: "D", 1000: "M", 10000: "Q"}
    RomanNumeralReverse = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000, "Q": 10000}
    while True:
        number = input("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)\nEnter roman number:\n")
        if not isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse):
            print("Error roman number")
            continue
        print("Arabian number =", translation(number, RomanNumeralReverse))

def main():
    while True:
        print("Input Zadanie number")
        print("1 - Zadanie1_1")
        print("2 - Zadanie2_1")
        print("3 - Zadanie3_21")
        s = input("Enter number: ")
        if s == '3':
            Zadanie3_21()
        elif s == '2':
            Zadanie2_1()
        elif s == '1':
            Zadanie1_1()
        else:
            print("Error")

if __name__ == "__main__":
    main()