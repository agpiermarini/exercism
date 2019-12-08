// Package acronym Exercism Challenge
package acronym

import (
	"regexp"
	"strings"
)

// Abbreviate function returns the initialism of a string
func Abbreviate(s string) string {
	re := regexp.MustCompile("[\\s-]")
	words := re.Split(s, -1)

	var initialism strings.Builder
	initialism.Grow(len(words))

	for _, word := range words {
		re := regexp.MustCompile("[A-Za-z]")
		firstLetter := re.FindString(word)
		if len(firstLetter) > 0 {
			initialism.WriteString(firstLetter)
		}
	}

	return strings.ToUpper(initialism.String())
}
