import java.util.*

fun main() {
   zadanie1_1()
}

fun zadanie1_1() {
    val numbers = intArrayOf(76, 24, -614, 14, 1153)
    for (i in numbers.indices) {
        if (numbers[i] > 0)
        {
        var a = numbers[i]
        var sum = 0
        var mult = 1
        while (a > 0) {
            val b = a % 10
            sum += b
            mult *= b
            a /= 10
        }
        if (sum < mult) println("Index number = $i")
        }
    }
}

fun zadanie3_21() {
    val scanner = Scanner(System.`in`)
    print("Enter the string: ")
    val s = scanner.nextLine()
    var counterNull = 1
    for (i in 0 until s.length - 1) {
        if (s[i] == '0' && s[i + 1] == '0') {
            counterNull++
        }
        if (i < s.length - 2 && s[i + 1] == '1' && s[i] == '0') {
            if (i - counterNull >= 0 && s[i - counterNull] == '1' && s[i - counterNull + 1] == '0') {
                println(s.substring(i - counterNull, i - counterNull + counterNull + 2))
                counterNull = 1
            }
        }
    }
    zadanie3_21()
}

fun zadanie2_1() {
    val romanNumeral: MutableMap<Int, String> = HashMap()
    romanNumeral[1] = "I"
    romanNumeral[5] = "V"
    romanNumeral[10] = "X"
    romanNumeral[50] = "L"
    romanNumeral[100] = "C"
    romanNumeral[500] = "D"
    romanNumeral[1000] = "M"
    romanNumeral[10000] = "Q"

    val romanNumeralReverse: MutableMap<String, Int> = HashMap()
    romanNumeralReverse["I"] = 1
    romanNumeralReverse["V"] = 5
    romanNumeralReverse["X"] = 10
    romanNumeralReverse["L"] = 50
    romanNumeralReverse["C"] = 100
    romanNumeralReverse["D"] = 500
    romanNumeralReverse["M"] = 1000
    romanNumeralReverse["Q"] = 10000

    askForRomanNumber(romanNumeral, romanNumeralReverse)
}

fun askForRomanNumber(romanNumeral: Map<Int, String>, romanNumeralReverse: Map<String, Int>) {
    val scanner = Scanner(System.`in`)
    print("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)\nEnter roman number: ")
    val number = scanner.nextLine()
    if (!isValidRomanNumeral(number, romanNumeral, romanNumeralReverse)) {
        println("Error roman number")
        askForRomanNumber(romanNumeral, romanNumeralReverse)
    } else {
        println("Arabian number = " + translation(number, romanNumeralReverse))
    }
}

fun isValidRomanNumeral(romanNumber: String, romanNumeral: Map<Int, String>, romanNumeralReverse: Map<String, Int>): Boolean {
    var counterForTwo = 0
    for (i in romanNumber.indices) {
        var isValidCounter = 0
        for ((_, value) in romanNumeral) {
            if (romanNumber[i] == value[0]) {
                isValidCounter++
                break
            }
        }
        if (isValidCounter == 0) return false
    }
    for (i in 0 until romanNumber.length - 1) {
        if ((romanNumber[i] == romanNumeral[5]?.get(0) && romanNumber[i + 1] == romanNumeral[5]?.get(0)) ||
            (romanNumber[i] == romanNumeral[50]?.get(0) && romanNumber[i + 1] == romanNumeral[50]?.get(0)) ||
            (romanNumber[i] == romanNumeral[500]?.get(0) && romanNumber[i + 1] == romanNumeral[500]?.get(0))
        ) {
            counterForTwo++
        }
        if (counterForTwo > 0) return false
        var repeatCountThreeTimes = 0
        for (j in i until romanNumber.length) {
            if (romanNumber[i] == romanNumber[j]) repeatCountThreeTimes++
            else break
        }
        if (repeatCountThreeTimes > 3) return false
    }
    return true
}

fun translation(romanNumber: String, romanNumeralReverse: Map<String, Int>): Int {
    var total = 0
    var prevValue = 0
    for (i in romanNumber.length - 1 downTo 0) {
        val value = romanNumeralReverse[romanNumber[i].toString()] ?: 0
        if (value < prevValue) {
            total -= value
        } else {
            total += value
        }
        prevValue = value
    }
    return total
}
