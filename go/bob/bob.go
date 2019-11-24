// Package bob Exercism challenge
package bob

import (
	"regexp"
	"strings"
)

// Hey determines Bob's response to a given remark
func Hey(remark string) string {
	remarkTrimmed := strings.TrimSpace(remark)

	isSilent := len(remarkTrimmed) == 0
	isYelling := IsYelling(remarkTrimmed)
	isAsking := strings.HasSuffix(remarkTrimmed, "?")

	switch {
	case isSilent:
		return "Fine. Be that way!"
	case isYelling && isAsking:
		return "Calm down, I know what I'm doing!"
	case isYelling:
		return "Whoa, chill out!"
	case isAsking:
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
