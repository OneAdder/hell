library(tidyverse)

#1
norm_distr = function (x) {
    dlnorm(x=x, mean=3, sd=0.5)
}
print(integrate(norm_distr, lower=25, upper=50)$value)

#2
lower = quantile(dlnorm(0:100, mean=3, sd=0.5), 0.1) 
upper = quantile(dlnorm(0:100, mean=3, sd=0.5), 0.9)
print(integrate(norm_distr, lower=lower, upper=upper)$value)
