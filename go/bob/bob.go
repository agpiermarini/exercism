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
	} else if IsYelling(remarkTrimmed) {
		if IsAsking(remarkTrimmed) {
			return "Calm down, I know what I'm doing!"
		}
		return "Whoa, chill out!"
	} else if IsAsking(remarkTrimmed) {
		return "Sure."
	}
	return "Whatever."
}

// IsYelling evaluates whether remark is aggressive
func IsYelling(remark string) bool {
	// Match on one or more uppercase leters and no lowercase
	re := regexp.MustCompile("^[^a-z]+[A-Z].*")
	return re.MatchString(remark)
}

// IsAsking evaluates whether remark ends with a question
func IsAsking(remark string) bool {
	return strings.HasSuffix(remark, "?")
}
