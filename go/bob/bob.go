// Package bob Exercism challenge

package bob

import (
	"regexp"
	"strings"
)

// Hey determines Bob's response to a given remark
func Hey(remark string) string {
	remarkTrimmed := strings.TrimSpace(remark)

	if remarkTrimmed == "" {
		return "Fine. Be that way!"
	} else if isYelling(remark) {
		if isAsking(remarkTrimmed) {
			return "Calm down, I know what I'm doing!"
		}
		return "Whoa, chill out!"
	} else if isAsking(remarkTrimmed) {
		return "Sure."
	} else {
		return "Whatever."
	}
}

// isYelling evaluates whether remark is aggressive
func isYelling(remark string) bool {
	return hasLetters(remark) && remark == strings.ToUpper(remark)
}

// hasLetters evaluates whether remark has one or more characters
func hasLetters(remark string) bool {
	hasMatch, err := regexp.Match(`[a-zA-Z]`, []byte(remark))
	return hasMatch && err == nil
}

// isAsking evaluates whether remark ends with a question
func isAsking(remark string) bool {
	lastChar := remark[len(remark)-1:]
	return lastChar == "?"
}
