fun zadanie1_1() {
    val numbers = listOf(76, 24, 614, 14, 1153)
    for (i in numbers.indices) {
        if (numbers[i] < 0) {
            break
        }
        var a = numbers[i]
        var sumVal = 0
        var mult = 1
        var temp = a
        while (temp > 0) {
            val b = temp % 10
            sumVal += b
            mult *= b
            temp /= 10
        }
        if (sumVal < mult) {
            println("Index number = $i")
        }
    }
}

fun zadanie3_21() {
    while (true) {
        var counterNull = 1
        print("Enter the string: ")
        val S = readLine()
        if (S != null) {
            for (i in 0 until S.length - 1) {
                if (S[i] == '0' && S[i + 1] == '0') {
                    counterNull++
                }
                if (i < S.length - 2 && S[i + 1] == '1' && S[i] == '0') {
                    if (i - counterNull >= 0 && S[i - counterNull] == '1' && S[i - counterNull + 1] == '0') {
                        println(S.substring(i - counterNull, i - counterNull + counterNull + 2))
                        counterNull = 1
                    }
                }
            }
        }
    }
}

fun zadanie2_1() {
    val romanNumeral = mapOf(1 to "I", 5 to "V", 10 to "X", 50 to "L", 100 to "C", 500 to "D", 1000 to "M", 10000 to "Q")
    val romanNumeralReverse = mapOf("I" to 1, "V" to 5, "X" to 10, "L" to 50, "C" to 100, "D" to 500, "M" to 1000, "Q" to 10000)
    while (true) {
        println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
        print("Enter roman number: ")
        var number = readLine()
        while (number != null && !is_valid_roman_numeral(number, romanNumeral, romanNumeralReverse)) {
            println("Error roman number")
            print("Enter roman number: ")
            number = readLine()
        }
        println("Arabian number = ${translation(number!!, romanNumeralReverse)}")
    }
}

fun is_valid_roman_numeral(romanNumber: String, romanNumeral: Map<Int, String>, romanNumeralReverse: Map<String, Int>): Boolean {
    var counterForTwo = 0
    for (i in romanNumber.indices) {
        var isValidCounter = 0
        for ((_, value) in romanNumeral) {
            if (romanNumber[i].toString() == value) {
                isValidCounter++
                break
            }
        }
        if (isValidCounter == 0) {
            return false
        }
    }
    for (i in 0 until romanNumber.length - 1) {
        val currentSymbol = romanNumber[i]
        val nextSymbol = romanNumber[i + 1]
        if ((currentSymbol == romanNumeral[5]!![0] && nextSymbol == romanNumeral[5]!![0]) ||
            (currentSymbol == romanNumeral[50]!![0] && nextSymbol == romanNumeral[50]!![0]) ||
            (currentSymbol == romanNumeral[500]!![0] && nextSymbol == romanNumeral[500]!![0])
        ) {
            counterForTwo++
        }
        if (counterForTwo > 0) {
            return false
        }
        var repeatCountThreeTimes = 0
        for (j in i until romanNumber.length) {
            if (romanNumber[i] == romanNumber[j]) {
                repeatCountThreeTimes++
            } else {
                break
            }
        }
        if (repeatCountThreeTimes > 3) {
            return false
        }
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

fun main() {
    while (true) {
        println("Input Zadanie number")
        println("1 - Zadanie1_1")
        println("2 - Zadanie2_1")
        println("3 - Zadanie3_21")
        print("Enter number: ")
        val s = readLine()
        when (s) {
            "3" -> zadanie3_21()
            "2" -> zadanie2_1()
            "1" -> zadanie1_1()
            else -> println("Error")
        }
    }
}