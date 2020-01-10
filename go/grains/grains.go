// Package grains Exercism challenge
package grains

import (
	"errors"
)

// Square function returns the number of grains on a chess board square
func Square(square int) (uint64, error) {
	if square > 0 && square <= 64 {
		total := 1
		for i := 2; i <= square; i++ {
			total = total * 2
		}
		return uint64(total), nil
	}
	return 0, errors.New("Square must be between 1 and 64, inclusive")
}

// Total function returns total of all grains on the chess board
func Total() uint64 {
	const total uint64 = 18446744073709551615
	return total
}
