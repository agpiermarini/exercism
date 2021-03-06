// Package twofer Exercism challenge
package twofer

import "fmt"

// ShareWith interpolates name with default statement
func ShareWith(name string) string {
	if name == "" {
		return "One for you, one for me."
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
