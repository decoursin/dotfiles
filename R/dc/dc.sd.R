# Computes the standard deviation where the estimator
# is not corrected at N-1 but just N.
# http://stackoverflow.com/questions/6457755/standard-deviation-in-r-seems-to-be-returning-the-wrong-answer-am-i-doing-some


dc.sd <- function (x) {
	sd(x) * sqrt((length(x)-1)/length(x))
}

