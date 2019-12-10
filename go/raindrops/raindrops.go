// Package raindrops Exercism challenge
package raindrops

import (
	"strconv"
	"strings"
)

// Convert function transforms integer to a symphony of sounds
func Convert(input int) string {
	sounds := make(map[int]string)
	sounds[3], sounds[5], sounds[7] = "Pling", "Plang", "Plong"

	var b strings.Builder
	b.Grow(15)

	numbers := [3]int{3, 5, 7}
	for _, num := range numbers {
		if input%num == 0 {
			b.WriteString(sounds[num])
		}
	}

	result := b.String()
	if len(result) == 0 {
		return strconv.Itoa(input)
	}

	return result
}
