data = read.csv('https://raw.githubusercontent.com/agricolamz/2019_data_analysis_for_linguists/master/data/students/OneAdder/hw3_Bayesian_inference/hw3_phoible.csv')
 
#1
print(prod(dnorm(data$consonants, mean = 22, sd = 6)))

#2
data = read.csv('https://raw.githubusercontent.com/agricolamz/2019_data_analysis_for_linguists/master/data/letter_frequency.csv')

print(head(data))
