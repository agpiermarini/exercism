// Package hamming Exercism challenge
package hamming

import "errors"

//Distance function generates hamming distance of two DNA strands
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("Strings are of differing lengths")
	} else if a == b {
		return 0, nil
	}

	hammingCount := 0
	for pos, char := range a {
		if char != []rune(b)[pos] {
			hammingCount++
		}
	}

	return hammingCount, nil
}
