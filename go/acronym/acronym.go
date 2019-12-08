// Package acronym Exercism Challenge
package acronym

import (
	"regexp"
	"strings"
)

// Abbreviate function returns the initialism of a string
func Abbreviate(s string) string {
	reSplit := regexp.MustCompile("[\\s-]")
	words := reSplit.Split(s, -1)

	var initialism strings.Builder
	initialism.Grow(len(words))

	reFind := regexp.MustCompile("[A-Za-z]")
	for _, word := range words {
		firstLetter := reFind.FindString(word)
		if len(firstLetter) > 0 {
			initialism.WriteString(firstLetter)
		}
	}

	return strings.ToUpper(initialism.String())
}
