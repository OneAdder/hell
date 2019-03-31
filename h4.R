get_means_sds = function (speaker){
    mean_ = mean(o$vowel.dur, trim=0.1)
    sd_ = sd(o$vowel.dur)
    
    mean_sp = mean(o[o$speaker == speaker,]$vowel.dur)
    sd_sp = sd(o[o$speaker == speaker,]$vowel.dur)
    
    mean_post = weighted.mean(c(mean_, mean_sp), c(1/sd_, 1/sd_sp))
    sd_post = 1 / (1/sd_ + 1/sd_sp)
    
    return(list(mean_=mean_, sd_=sd_, mean_sp=mean_sp, sd_sp=sd_sp, mean_post=mean_post, sd_post=sd_post))
}


o = read.csv('https://raw.githubusercontent.com/agricolamz/2019_data_analysis_for_linguists/master/data/students/OneAdder/hw4_Advanced_Bayesian/hw4_caretta.csv')

#1
means = get_means_sds("brs02")
print(data.frame(speaker='brs02', mean_post=means$mean_post, sd_post=means$sd_post))

#2
means = get_means_sds("tt01")
cred_int_d = qnorm(.025, mean=means$mean_post, sd=means$sd_post)
cred_int_u = qnorm(.975, mean=means$mean_post, sd=means$sd_post)
print(data.frame(speaker='tt01', int1=cred_int_d, int2=cred_int_u))

