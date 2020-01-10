// Package grains Exercism challenge
package grains

import (
	"errors"
	"math"
)

// Square function returns the number of grains on a chess board square
func Square(square int) (uint64, error) {
	if square > 0 && square <= 64 {
		total := uint64(math.Pow(2, float64(square-1)))
		return total, nil
	}
	return 0, errors.New("square must be between 1 and 64, inclusive")
}

// Total function returns total of all grains on the chess board
func Total() uint64 {
	const total uint64 = 18446744073709551615
	return total
}
