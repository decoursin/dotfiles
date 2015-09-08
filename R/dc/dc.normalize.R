# By: Nick DeCoursin
# Date: 08/23/2015

# Example:
# (range) http://stats.stackexchange.com/questions/70801/how-to-normalize-data-to-0-1-range

# normalizes data
# func1: function
# func2: function
# x: numeric vector
# returns: numeric vector
dc.normalize <- function (x, func1, func2) {
  (x - func1(x)) / func2(x)  
}


# normalizes data with a new mean of 0
# and standard deviation of 1
# x: numeric vector
# returns: numeric vector
dc.normalize.around.mean.by.sd <- function (x) {
  dc.normalize(x, mean, sd)
}

# normalizes data to range between 0 and 1
# x: should be numeric vector
# returns: numeric vector
dc.normalize.by.range <- function (x) {
  # should check that the range != 0
  dc.normalize(x, min, range)
}
