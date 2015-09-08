# Computes the range
# the base range function 
# returns the max and the min.
# this, instead, returns the max - min.

dc.range <- function (x) {
  max(x) - min(x)
}