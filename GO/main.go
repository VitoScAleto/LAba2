package main

import (
	"fmt"
)

func main() {
	Zadanie1_1()
	//Zadanie2_1()
	Zadanie3_21()
}

func Zadanie1_1() {
	numbers := []int{76, 24, 614, 14, 1153}
	for i := 0; i < len(numbers); i++ {
		if numbers[i] < 0 {
			break
		}
		a := numbers[i]
		sum := 0
		mult := 1
		for a > 0 {
			b := a % 10
			sum += b
			mult *= b
			a /= 10
		}
		if sum < mult {
			fmt.Printf("Index number = %d\n", i)
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
	var number string
	for {
		for {
			fmt.Println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
			fmt.Println("Enter roman number:")
			fmt.Scanln(&number)
			if !isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse) {
				fmt.Println("Error roman number")
			} else {
				break
			}
		}
		fmt.Printf("Arabian number = %d\n", translation(number, RomanNumeralReverse))
	}
}

func isValidRomanNumeral(romanNumber string, RomanNumeral map[int]string, RomanNumeralReverse map[string]int) bool {
	for i := 0; i < len(romanNumber); i++ {
		isValidCounter := 0
		for _, v := range RomanNumeral {
			if romanNumber[i:i+1] == v {
				isValidCounter++
				break
			}
		}
		if isValidCounter == 0 {
			return false
		}
	}
	counterForTwo := 0
	for i := 0; i < len(romanNumber); i++ {
		if romanNumber[i:i+1] == RomanNumeral[5] && romanNumber[i+1:i+2] == RomanNumeral[5] {
			counterForTwo++
		} else if romanNumber[i:i+1] == RomanNumeral[50] && romanNumber[i+1:i+2] == RomanNumeral[50] {
			counterForTwo++
		} else if romanNumber[i:i+1] == RomanNumeral[500] && romanNumber[i+1:i+2] == RomanNumeral[500] {
			counterForTwo++
		}
		if counterForTwo > 0 {
			return false
		}
		repeatCountThreeTimes := 0
		for j := 0; j < len(romanNumber); j++ {
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

func Zadanie3_21() {
	for {
		counterNull := 1
		var S string
		fmt.Println("Enter the string:")
		fmt.Scanln(&S)
		for i := 0; i < len(S); i++ {
			if S[i:i+1] == "0" && S[i+1:i+2] == "0" {
				counterNull++
			}
			if S[i+1:i+2] == "1" && S[i:i+1] == "0" {
				if S[i-counterNull:i-counterNull+1] == "1" && S[i-counterNull+1:i-counterNull+2] == "0" {
					fmt.Println(S[i-counterNull : i-counterNull+counterNull+2])
					counterNull = 1
				}
			}
		}
		S = ""
	}
}
