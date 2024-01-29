package util

import (
	"math/rand"
	"time"
)

func init() {
	rand.Seed(time.Now().UnixNano())
}

// RandomInt generates a random integer between main and max
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}
