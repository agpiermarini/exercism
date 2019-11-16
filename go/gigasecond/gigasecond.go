// Package gigasecond Exercism challenge
package gigasecond

import (
	"time"
)

// AddGigasecond adds a gigasecond (10^9 seconds) to a given time
func AddGigasecond(timeIn time.Time) time.Time {
	const gigasecond time.Duration = time.Second * 1000000000
	timeOut := timeIn.Add(gigasecond)

	return timeOut
}
