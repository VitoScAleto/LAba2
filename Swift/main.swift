import Foundation

func zadanie1_1() {
    let numbers = [76, 24, 614, -14, 1153]
    for number in numbers {
        if number > 0 {
            var a = number
            var sum = 0
            var mult = 1
            while a > 0 {
                let b = a % 10
                sum += b
                mult *= b
                a /= 10
            }
            if sum < mult {
                print("Index number = \(number)")
            }
        }
    }
}

func zadanie3_21() {
    while true {
        var counterNull = 1
        print("Enter the string:")
        if let S = readLine() {
            for i in 0..<(S.count - 1) {
                if S[S.index(S.startIndex, offsetBy: i)] == "0" && S[S.index(S.startIndex, offsetBy: i+1)] == "0" {
                    counterNull += 1
                }
                if S[S.index(S.startIndex, offsetBy: i+1)] == "1" && S[S.index(S.startIndex, offsetBy: i)] == "0" {
                    if S[S.index(S.startIndex, offsetBy: i-counterNull)] == "1" && S[S.index(S.startIndex, offsetBy: i-counterNull+1)] == "0" {
                        print(String(S[S.index(S.startIndex, offsetBy: i-counterNull)...S.index(S.startIndex, offsetBy: i-counterNull+2)]))
                        counterNull = 1
                    }
                }
            }
        }
    }
}

func zadanie2_1() {
    let romanNumeral = [
        1: "I",
        5: "V",
        10: "X",
        50: "L",
        100: "C",
        500: "D",
        1000: "M",
        10000: "Q"
    ]
    let romanNumeralReverse = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
        "Q": 10000
    ]
    var number: String = ""
    while true {
        repeat {
            print("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
            print("Enter roman number: ", terminator: "")
            if let input = readLine() {
                number = input
                if !isValidRomanNumeral(number, romanNumeral, romanNumeralReverse) {
                    print("Error roman number")
                }
            }
        } while !isValidRomanNumeral(number, romanNumeral, romanNumeralReverse)
        print("Arabian number = \(translation(number, romanNumeralReverse))")
    }
}

func isValidRomanNumeral(_ romanNumber: String, _ RomanNumeral: [Int: String], _ RomanNumeralReverse: [String: Int]) -> Bool {
    var counterForTwo = 0
    for i in 0..<(romanNumber.count - 1) {
        var isValidCounter = 0
        for (_, value) in RomanNumeral {
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
        if String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == RomanNumeral[5] && String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i+1)]) == RomanNumeral[5] {
            counterForTwo += 1
        } else if String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == RomanNumeral[50] && String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i+1)]) == RomanNumeral[50] {
            counterForTwo += 1
        } else if String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)]) == RomanNumeral[500] && String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i+1)]) == RomanNumeral[500] {
            counterForTwo += 1
        }
        if counterForTwo > 0 {
            return false
        }
        var repeatCountThreeTimes = 0
        for j in 0..<(romanNumber.count - 1) {
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

func translation(_ romanNumber: String, _ RomanNumeralReverse: [String: Int]) -> Int {
    var total = 0
    var prevValue = 0
    for i in (0..<romanNumber.count).reversed() {
        let value = RomanNumeralReverse[String(romanNumber[romanNumber.index(romanNumber.startIndex, offsetBy: i)])]!
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
    print("Input Zadanie number")
    print("1 - Zadanie1_1")
    print("2 - Zadanie2_1")
    print("3 - Zadanie3_21")
    print("Enter number: ", terminator: "")
    if let input = readLine(), let s = input.first {
        switch s {
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