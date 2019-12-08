// Package space (Space Age) Exercism Challenge
package space

import (
	"math"
	"strings"
)

// Age function calculates a persons age on a given planet
func Age(seconds float64, planet string) float64 {
	conversions := map[string]float64{
		"mercury": 0.2408467,
		"venus":   0.61519726,
		"earth":   1.0,
		"mars":    1.8808158,
		"jupiter": 11.862615,
		"saturn":  29.447498,
		"uranus":  84.016846,
		"neptune": 164.79132,
	}

	inEarthYears := seconds / 31557600
	convertedAge := inEarthYears / conversions[strings.ToLower(planet)]

	return math.Round((convertedAge * 100)) / 100
}
