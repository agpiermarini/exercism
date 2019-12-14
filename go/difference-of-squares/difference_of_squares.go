// Package diffsquares Exercism challenge
package diffsquares

// Difference function returns square of sums of first n natural numbers minus
// sum of squares of first n natural numbers of a given integer
func Difference(num int) int {
	return SquareOfSum(num) - SumOfSquares(num)
}

// SquareOfSum functions returns the square of sums of first n natural numbers of given integer
func SquareOfSum(num int) int {
	sum := num * (num + 1) / 2
	return sum * sum
}

// SumOfSquares functions returns the sum of the squares of first n natural numbers of given integer
func SumOfSquares(num int) int {
	return num * (num + 1) * (2*num + 1) / 6
}
