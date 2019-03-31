data = read.csv('https://raw.githubusercontent.com/agricolamz/2019_data_analysis_for_linguists/master/data/students/OneAdder/hw2_Bayesian_inference/hw2_phoible.csv')

#1
data$ratio = data$consonants / data$phonemes

maximum = data$language[data$ratio == max(data$ratio)]
print(toString(maximum))

#2
beta_dist = dbeta(data$ratio, shape1=9.300246, shape2=4.4545)

apost_dist = beta_dist / sum(beta_dist)

data$diff = abs(apost_dist - data$ratio)
print(data[order(-data$diff),][1: 6,])
