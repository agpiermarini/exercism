// Package acronym Exercism Challenge
package acronym

import (
	"regexp"
	"strings"
	"unicode"
)

// Abbreviate function returns the acronym of a string
func Abbreviate(s string) string {
	modString := CaptureChars(s)

	re := regexp.MustCompile("\\B(.)")
	leadingChars := re.ReplaceAllString(modString, "")

	acronym := RemoveSpaces(leadingChars)

	return strings.ToUpper(acronym)
}

// CaptureChars function plucks letter characters from string
// Also replaces hyphens with a space
func CaptureChars(s string) string {
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

// RemoveSpaces removes spaces from a string
func RemoveSpaces(str string) string {
	var b strings.Builder
	b.Grow(len(str))
	for _, ch := range str {
		if !unicode.IsSpace(ch) {
			b.WriteRune(ch)
		}
	}
	return b.String()
}
