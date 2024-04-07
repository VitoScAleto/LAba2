import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    do {
        println("Input Zadanie number")
        println("1 - Zadanie1_1")
        println("2 - Zadanie2_1")
        println("3 - Zadanie3_21")
        println("Enter number: ")
        val s = readLine()?.get(0)
        when (s) {
            '3' -> zadanie3_21(scanner)
            '2' -> zadanie2_1(scanner)
            '1' -> zadanie1_1()
            else -> println("Error")
        }
    } while (true)
}

fun zadanie1_1() {
    val numbers = listOf(76, 24, 614, 14, 1153)
    for ((i, number) in numbers.withIndex()) {
        if (number < 0) break
        var a = number
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

fun zadanie3_21(scanner: Scanner) {
    while (true) {
        var counterNull = 1
        println("Enter the string:")
        val s = scanner.nextLine()
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
    }
}

fun zadanie2_1(scanner: Scanner) {
    val romanNumeral = mapOf(
        1 to "I",
        5 to "V",
        10 to "X",
        50 to "L",
        100 to "C",
        500 to "D",
        1000 to "M",
        10000 to "Q"
    )

    val romanNumeralReverse = mapOf(
        "I" to 1,
        "V" to 5,
        "X" to 10,
        "L" to 50,
        "C" to 100,
        "D" to 500,
        "M" to 1000,
        "Q" to 10000
    )

    var number: String
    while (true) {
        do {
            println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
            print("Enter roman number: ")
            number = scanner.next()
            if (!isValidRomanNumeral(number, romanNumeral, romanNumeralReverse)) {
                println("Error roman number")
            }
        } while (!isValidRomanNumeral(number, romanNumeral, romanNumeralReverse))
        println("Arabian number = ${translation(number, romanNumeralReverse)}")
    }
}

fun isValidRomanNumeral(romanNumber: String, romanNumeral: Map<Int, String>, romanNumeralReverse: Map<String, Int>): Boolean {
    var counterForTwo = 0
    for (i in 0 until romanNumber.length) {
        if (!romanNumeral.values.contains(romanNumber[i].toString())) {
            return false
        }
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
