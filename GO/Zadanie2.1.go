package main

import (
	"fmt"
)

var RomanNumeral = map[string]int{
	"I": 1,
	"V": 5,
	"X": 10,
	"L": 50,
	"C": 100,
	"D": 500,
	"M": 1000,
}

func main() {
	var number string
	for {
		for {
			fmt.Println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)")
			fmt.Println("Enter roman number:")
			fmt.Scan(&number)
			if !isValidRomanNumeral(number) {
				fmt.Println("Error roman number")
			} else {
				break
			}
		}
		sum := translation(number)
		fmt.Println("Arabian number =", sum)
	}
}

func isValidRomanNumeral(romanNumber string) bool {
	for _, char := range romanNumber {
		if _, ok := RomanNumeral[string(char)]; !ok {
			return false
		}
	}

	for i := 0; i < len(romanNumber)-1; i++ {
		if romanNumber[i] == 'L' && romanNumber[i+1] == 'L' {
			return false
		} else if romanNumber[i] == 'D' && romanNumber[i+1] == 'D' {
			return false
		} else if romanNumber[i] == 'V' && romanNumber[i+1] == 'V' {
			return false
		}
	}

	for i := 0; i < len(romanNumber); i++ {
		count := 1
		for j := i + 1; j < len(romanNumber); j++ {
			if romanNumber[i] == romanNumber[j] {
				count++
			} else {
				break
			}
		}
		if count > 3 {
			return false
		}
	}

	return true
}

func translation(romanNumber string) int {
	total := 0
	prevValue := 0
	for i := len(romanNumber) - 1; i >= 0; i-- {
		value := RomanNumeral[string(romanNumber[i])]
		if value < prevValue {
			total -= value
		} else {
			total += value
		}
		prevValue = value
	}

	return total
}
