// Package luhn Exercism challenge
package luhn

import (
	"regexp"
	"strconv"
)

// Valid function takes a string input and returns a boolean as to
// whether the string is valid according to the Luhn Algorithm
func Valid(input string) bool {
	cleanInput := CleanInput(input)

	if len(cleanInput) <= 1 {
		return false
	}

	return CheckSum(cleanInput)
}

// CleanInput function takes a string; if input is limited to strings and spaces, it
// returns the input stripped of spaces, else it returns an empty string
func CleanInput(input string) string {
	re1, re2 := regexp.MustCompile("\\s"), regexp.MustCompile("([^\\d\\s])")

	cleanInput := re1.ReplaceAllString(input, "")
	nan := re2.FindString(input)

	if len(nan) > 0 {
		return ""
	}
	return cleanInput
}

// CheckSum function returns bool as to whether input is valid according to the Luhn algorithm
func CheckSum(input string) bool {
	var result int
	for i, j := 1, len(input)-1; j >= 0; i, j = i+1, j-1 {
		num, _ := strconv.Atoi(string(input[j]))
		if i%2 == 0 {
			if num > 4 {
				result += num - 9
			} else {
				result += num
			}
		}
		result += num
	}
	return result%10 == 0
}
