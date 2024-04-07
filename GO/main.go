package main

import (
	"bufio" // ввод и вывод
	"fmt"   //Пакет fmt реализует форматированный ввод-вывод с помощью функций, аналогичных printf и scanf языка C.
	"os"
	"strings" //  работа со строками
)

func Zadanie1_1() {
	numbers := []int{76, 24, 614, 14, 1153} // массив чисел
	for i := 0; i < len(numbers); i++ {
		if numbers[i] < 0 {
			break
		}
		a := numbers[i]
		sum := 0  //сумма цифр
		mult := 1 //умножение
		for a > 0 {
			b := a % 10 // находим остаток от деления на 10(123%10=3)
			sum += b    // сумма
			mult *= b   //произведение
			a = a / 10  // целосиленное деление числа(понижаем разряд 123/10=12)
		}
		if sum < mult { //если сумма меньше произведения выводим индекс данного числа
			fmt.Printf("Index number = %d\n", i)
		}
	}
}

func Zadanie3_21() {
	reader := bufio.NewReader(os.Stdin) // считывание ввода с консоли
	for {
		counterNull := 1
		fmt.Println("Enter the string:")
		S, _ := reader.ReadString('\n')
		S = strings.TrimSpace(S) // удаляем пробелы в строке с помощью TrimSpace
		for i := 0; i < len(S)-1; i++ {
			if S[i:i+1] == "0" && S[i+1:i+2] == "0" {
				counterNull++
			}
			if i < len(S)-2 && S[i+1:i+2] == "1" && S[i:i+1] == "0" {
				if i-counterNull >= 0 && S[i-counterNull:i-counterNull+1] == "1" && S[i-counterNull+1:i-counterNull+2] == "0" {
					fmt.Println(S[i-counterNull : i-counterNull+counterNull+2])
					counterNull = 1
				}
			}
		}
	}
}

func Zadanie2_1() {
	RomanNumeral := map[int]string{
		1:     "I",
		5:     "V",
		10:    "X",
		50:    "L",
		100:   "C",
		500:   "D",
		1000:  "M",
		10000: "Q",
	}

	RomanNumeralReverse := map[string]int{
		"I": 1,
		"V": 5,
		"X": 10,
		"L": 50,
		"C": 100,
		"D": 500,
		"M": 1000,
		"Q": 10000,
	}

	reader := bufio.NewReader(os.Stdin)
	for {
		for {
			fmt.Println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
			fmt.Println("Enter roman number:")
			number, _ := reader.ReadString('\n')
			number = strings.TrimSpace(number)
			if !isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse) {
				fmt.Println("Error roman number")
			} else {
				fmt.Printf("Arabian number = %d\n", translation(number, RomanNumeralReverse))
				break
			}
		}
	}
}

func isValidRomanNumeral(romanNumber string, RomanNumeral map[int]string, RomanNumeralReverse map[string]int) bool {
	counterForTwo := 0
	for i := 0; i < len(romanNumber); i++ {
		isValidCounter := 0
		for _, value := range RomanNumeral {
			if romanNumber[i:i+1] == value {
				isValidCounter++
				break
			}
		}
		if isValidCounter == 0 {
			return false
		}
	}
	for i := 0; i < len(romanNumber)-1; i++ {
		if (romanNumber[i:i+1] == RomanNumeral[5] && romanNumber[i+1:i+2] == RomanNumeral[5]) ||
			(romanNumber[i:i+1] == RomanNumeral[50] && romanNumber[i+1:i+2] == RomanNumeral[50]) ||
			(romanNumber[i:i+1] == RomanNumeral[500] && romanNumber[i+1:i+2] == RomanNumeral[500]) {
			counterForTwo++
		}
		if counterForTwo > 0 {
			return false
		}
		repeatCountThreeTimes := 0
		for j := i; j < len(romanNumber); j++ {
			if romanNumber[i:i+1] == romanNumber[j:j+1] {
				repeatCountThreeTimes++
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

func translation(romanNumber string, RomanNumeralReverse map[string]int) int {
	total := 0
	prevValue := 0
	for i := len(romanNumber) - 1; i >= 0; i-- {
		value := RomanNumeralReverse[romanNumber[i:i+1]]
		if value < prevValue {
			total -= value
		} else {
			total += value
		}
		prevValue = value
	}
	return total
}

func main() {
	for {
		fmt.Println("Input Zadanie number")
		fmt.Println("1 - Zadanie1_1")
		fmt.Println("2 - Zadanie2_1")
		fmt.Println("3 - Zadanie3_21")
		fmt.Print("Enter number: ")
		var s string
		fmt.Scanln(&s)
		switch s {
		case "3":
			Zadanie3_21()
		case "2":
			Zadanie2_1()
		case "1":
			Zadanie1_1()
		default:
			fmt.Println("Error")
		}
	}
}
