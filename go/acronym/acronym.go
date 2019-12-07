// Package acronym Exercism Challenge
package acronym

import (
	"strings"
	"unicode"
)

// Abbreviate function returns the acronym of a string
func Abbreviate(s string) string {
	cleanedString := CleanString(s)
	acronym := BuildAcronym(cleanedString)

	return acronym
}

// CleanString function
func CleanString(s string) string {
	var b strings.Builder
	b.Grow(len(s))
	for _, ch := range s {
		if unicode.IsLetter(ch) || unicode.IsSpace(ch) {
			b.WriteRune(ch)
		} else if ch == '-' {
			b.WriteRune(' ')
		}
	}
	return b.String()
}

// BuildAcronym function
func BuildAcronym(s string) string {
	titleString := strings.Title(strings.ToLower(s))

	var b strings.Builder
	b.Grow(len(titleString))
	for _, ch := range titleString {
		if unicode.IsUpper(ch) {
			b.WriteRune(ch)
		}
	}
	return b.String()
}
