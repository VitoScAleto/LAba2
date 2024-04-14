func zadanie3_21() {
    print("Введите количество чисел для ввода:")
    if let size = readLine().flatMap({ Int($0) }) {
        var number: [Int] = []
        for i in 0..<size {
            print("Введите \(i + 1) число:")
            if let inputNumber = readLine().flatMap({ Int($0) }) {
                number.append(inputNumber)
            }
        }
        for i in 0..<size {
            if number[i] >= 0 {
                var a = number[i]
                var sum = 0
                var mult = 1
                while a > 0 {
                    let b = a % 10
                    sum += b
                    mult *= b
                    a /= 10
                }
                if sum < mult {
                    print("Index number = \(i)")
                }
            }
        }
    }
}

func zadanie1_1() {
    while true {
        var counterNull = 1
        print("Input string:")
        if let S = readLine() {
            for i in 0..<(S.count - 1) {
                if S[S.index(S.startIndex, offsetBy: i)] == "0" && S[S.index(S.startIndex, offsetBy: i + 1)] == "0" {
                    counterNull += 1
                }
                if i < S.count - 1 && S[S.index(S.startIndex, offsetBy: i + 1)] == "1" && S[S.index(S.startIndex, offsetBy: i)] == "0" {
                    if i - counterNull >= 0 && S[S.index(S.startIndex, offsetBy: i - counterNull)] == "1" && S[S.index(S.startIndex, offsetBy: i - counterNull + 1)] == "0" {
                        print(String(S[S.index(S.startIndex, offsetBy: i - counterNull)..<S.index(S.startIndex, offsetBy: i - counterNull + counterNull + 2)]))
                        counterNull = 1
                    }
                }
            }
        }
    }
}

func zadanie2_1() {
    let romanNumeral: [Int: String] = [1: "I", 5: "V", 10: "X", 50: "L", 100: "C", 500: "D", 1000: "M", 10000: "Q"]
    let romanNumeralReverse: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000, "Q": 10000]
    print("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
    print("Enter roman number:")
    if let number = readLine() {
        if !isValidRomanNumeral(romanNumber: number, RomanNumeral: romanNumeral, RomanNumeralReverse: romanNumeralReverse) {
            print("Error roman number")
        } else {
            print("Arabian number = \(translation(romanNumber: number, RomanNumeralReverse: romanNumeralReverse))")
        }
    }
}

func isValidRomanNumeral(romanNumber: String, RomanNumeral: [Int: String], RomanNumeralReverse: [String: Int]) -> Bool {
    var counterForTwo = 0
    for i in 0..<romanNumber.count {
        var isValidCounter = 0
        for value in RomanNumeral.values {
            if String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == value {
                isValidCounter += 1
                break
            }
        }
        if isValidCounter == 0 {
            return false
        }
    }
    for i in 0..<(romanNumber.count - 1) {
        if (String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == RomanNumeral[5] && String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i + 1)]) == RomanNumeral[5]) ||
           (String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == RomanNumeral[50] && String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i + 1)]) == RomanNumeral[50]) ||
           (String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == RomanNumeral[500] && String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i + 1)]) == RomanNumeral[500]) {
            counterForTwo += 1
        }
        if counterForTwo > 0 {
            return false
        }
        var repeatCountThreeTimes = 0
        for j in i..<romanNumber.count {
            if String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: j)]) {
                repeatCountThreeTimes += 1
            } else {
                break
            }
        }
        if repeatCountThreeTimes > 3 {
            return false
        }
    }
    return true
}

func translation(romanNumber: String, RomanNumeralReverse: [String: Int]) -> Int {
    var total = 0
    var prevValue = 0
    for i in (0..<romanNumber.count).reversed() {
        let value = RomanNumeralReverse[String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)])] ?? 0
        if value < prevValue {
            total -= value
        } else {
            total += value
        }
        prevValue = value
    }
    return total
}

while true {
    print("Input Zadanie number\n1 - Zadanie1_1\n2 - Zadanie2_1\n3 - Zadanie3_21\nEnter number: ")
    if let choice = readLine() {
        switch choice {
        case "3":
            zadanie3_21()
        case "2":
            zadanie2_1()
        case "1":
            zadanie1_1()
        default:
            print("Error")
        }
    }
}
