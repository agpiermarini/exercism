// Package luhn Exercism challenge
package luhn

import (
	"regexp"
	"strconv"
)

// Valid function determines if a number is valid according to the luhn algorithm
func Valid(input string) bool {
	re1, re2 := regexp.MustCompile("\\s"), regexp.MustCompile("([^\\d\\s])")
	numbers, nan := re1.ReplaceAllString(input, ""), re2.FindString(input)

	if len(numbers) <= 1 || len(nan) > 0 {
		return false
	}

	var result int
	for i, j := 1, len(numbers)-1; j >= 0; i, j = i+1, j-1 {
		num, _ := strconv.Atoi(string(numbers[j]))
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
