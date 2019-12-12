// Package isogram Exercism challenge
package isogram

import (
	"regexp"
	"strings"
)

// IsIsogram function returns boolean as to whether input is an isogram
func IsIsogram(input string) bool {
	charMap := make(map[string]int, len(input))

	re := regexp.MustCompile("[a-z]")
	chars := re.FindAllString(strings.ToLower(input), -1)

	for _, char := range chars {
		if _, ok := charMap[char]; ok {
			return false
		}
		charMap[char] = 1
	}
	return true
}
