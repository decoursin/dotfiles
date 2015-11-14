# By: Nick DeCoursin
# Date: 11/14/2015

# Simple API adjustment

## My api:
# x = the number of balls white balls desired to choose
# N = the amount of balls in the urn
# n = the amount of balls taken from the urn
# k = the number of white balls in the urn

dhyperN <- function (x, N, n, k) {
	white.balls <- k
	black.balls <- N-k
	dhyper(x,white.balls,black.balls,n)
}

phyperN <- function (q, N, n, k) {
	white.balls <- k
	black.balls <- N-k
	dhyper(q,white.balls,black.balls,n)
}

qhyperN <- function (p, N, n, k) {
	white.balls <- k
	black.balls <- N-k
	dhyper(p,white.balls,black.balls,n)
}

# i don't know this one
# because what's nn?
# rhyperN <- function (nn, N, n, k) {
# 	white.balls <- k
# 	black.balls <- N-k
# 	dhyper(x,white.balls,black.balls,n)
# }
