package main

import (
	"fmt"
	"strings"
)

func main() {
	Zadanie1_1()
	Zadanie2_1()
	Zadanie3_21()
}

func Zadanie1_1() {
	numbers := []int{76, 24, 614, 14, 1153}
	for i, a := range numbers {
		if a < 0 {
			break
		}
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
			if !isValidRomanNumeral(number, RomanNumeral) {
				fmt.Println("Error roman number")
			} else {
				break
			}
		}
		fmt.Printf("Arabian number = %d\n", translation(number, RomanNumeralReverse))
	}
}

func isValidRomanNumeral(romanNumber string, RomanNumeral map[int]string) bool {
	for _, v := range romanNumber {
		isValidCounter := false
		for _, r := range RomanNumeral {
			if string(v) == r {
				isValidCounter = true
				break
			}
		}
		if !isValidCounter {
			return false
		}
	}
	counterForTwo := 0
	for i := 0; i < len(romanNumber)-1; i++ {
		if romanNumber[i:i+2] == RomanNumeral[5] || romanNumber[i:i+2] == RomanNumeral[50] || romanNumber[i:i+2] == RomanNumeral[500] {
			counterForTwo++
		}
		if counterForTwo > 0 {
			return false
		}
		repeatCountThreeTimes := 0
		for j := i; j < len(romanNumber); j++ {
			if romanNumber[i] == romanNumber[j] {
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
		value := RomanNumeralReverse[string(romanNumber[i])]
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
		var S string
		fmt.Println("Enter the string:")
		fmt.Scanln(&S)
		substrings := strings.Split(S, "10")
		for _, sub := range substrings {
			if strings.HasPrefix(sub, "1") {
				fmt.Println("1" + sub)
			}
		}
		S = ""
	}
}
