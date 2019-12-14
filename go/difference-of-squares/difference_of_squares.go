// Package diffsquares Exercism challenge
package diffsquares

// Difference function returns the difference of squares
func Difference(number int) int {
	squareOfSums := SquareOfSum(number)
	sumOfSquares := SumOfSquares(number)
	return squareOfSums - sumOfSquares
}

// SquareOfSum functions returns the square of sums of a given array of ints
func SquareOfSum(number int) int {
	var result int
	for i := 1; i <= number; i++ {
		result = result + i
	}
	return result * result
}

// SumOfSquares functions returns the sum of the squares of a given array of ints
func SumOfSquares(number int) int {
	var result int
	for i := 1; i <= number; i++ {
		result = result + (i * i)
	}
	return result
}
