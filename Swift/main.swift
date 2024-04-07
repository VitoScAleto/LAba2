import Foundation

func zadanie1_1() {
    let numbers = [76, 24, 614, 14, 1153]
    var sum = 0
    var mult = 1
    
    for (index, number) in numbers.enumerated() {
        if number < 0 {
            break
        }
        
        var a = number
        while a > 0 {
            let b = a % 10
            sum += b
            mult *= b
            a /= 10
        }
        
        if sum < mult {
            print("Index number = \(index)")
        }
        
        sum = 0
        mult = 1
    }
}

func zadanie3_21() {
    while true {
        var counterNull = 1
        print("Enter the string:")
        let s = readLine() ?? ""
        
        for i in 0..<s.count {
            let index = s.index(s.startIndex, offsetBy: i)
            let nextIndex = s.index(after: index)
            
            if s[index] == "0" && s[nextIndex] == "0" {
                counterNull += 1
            }
            
            if s[nextIndex] == "1" && s[index] == "0" {
                let leftIndex = s.index(index, offsetBy: -counterNull)
                let leftNextIndex = s.index(after: leftIndex)
                
                if s[leftIndex] == "1" && s[leftNextIndex] == "0" {
                    let substring = s[leftIndex...index]
                    print(substring)
                    counterNull = 1
                }
            }
        }
    }
}

func zadanie2_1() {
    let romanNumeral: [Int: String] = [1: "I", 5: "V", 10: "X", 50: "L", 100: "C", 500: "D", 1000: "M", 10000: "Q"]
    let romanNumeralReverse: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000, "Q": 10000]
    
    while true {
        var number = ""
        
        repeat {
            print("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
            print("Enter roman number:")
            number = readLine() ?? ""
            
            if !isValidRomanNumeral(number: number, romanNumeral: romanNumeral, romanNumeralReverse: romanNumeralReverse) {
                print("Error roman number")
            }
        } while !isValidRomanNumeral(number: number, romanNumeral: romanNumeral, romanNumeralReverse: romanNumeralReverse)
        
        let arabianNumber = translation(number: number, romanNumeralReverse: romanNumeralReverse)
        print("Arabian number = \(arabianNumber)")
    }
}

func isValidRomanNumeral(number: String, romanNumeral: [Int: String], romanNumeralReverse: [String: Int]) -> Bool {
    var counterForTwo = 0
    
    for char in number {
        var isValidCounter = 0
        
        for (_, value) in romanNumeral {
            if String(char) == value {
                isValidCounter += 1
                break
            }
        }
        
        if isValidCounter == 0 {
            return false
        }
    }
    
    for (index, char) in number.enumerated() {
        let nextIndex = number.index(number.startIndex, offsetBy: index + 1)
        
        if String(char) == romanNumeral[5] && String(number[nextIndex]) == romanNumeral[5] {
            counterForTwo += 1
        } else if String(char) == romanNumeral[50] && String(number[nextIndex]) == romanNumeral[50] {
            counterForTwo += 1
        } else if String(char) == romanNumeral[500] && String(number[nextIndex]) == romanNumeral[500] {
            counterForTwo += 1
        }
        
        if counterForTwo > 0 {
            return false
        }
        
        var repeatCountThreeTimes = 0
        
        for j in 0..<number.count {
            let jIndex = number.index(number.startIndex, offsetBy: j)
            
            if String(char) == String(number[jIndex]) {
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

func translation(number: String, romanNumeralReverse: [String: Int]) -> Int {
    var total = 0
    var prevValue = 0
    
    for i in (0..<number.count).reversed() {
        let index = number.index(number.startIndex, offsetBy: i)
        let value = romanNumeralReverse[String(number[index])] ?? 0
        
        if value < prevValue {
            total -= value
        } else {
            total += value
        }
        
        prevValue = value
    }
    
    return total
}

zadanie1_1()
zadanie2_1()
zadanie3_21()