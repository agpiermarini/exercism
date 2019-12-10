// Package raindrops Exercism challenge
package raindrops

import (
	"strconv"
	"strings"
)

// Convert function transforms integer to a symphony of sounds
func Convert(input int) string {
	var b strings.Builder
	b.Grow(15)

	if input%3 == 0 {
		b.WriteString("Pling")
	}

	if input%5 == 0 {
		b.WriteString("Plang")
	}

	if input%7 == 0 {
		b.WriteString("Plong")
	}

	result := b.String()
	if len(result) > 0 {
		return result
	}
	return strconv.Itoa(input)
}
