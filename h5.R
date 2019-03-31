library(tidyverse)
library(ca)
library(ggplot2)
chairs = read.csv('https://raw.githubusercontent.com/agricolamz/2019_data_analysis_for_linguists/master/data/students/OneAdder/hw5_CA_MCA/hw5_chairs.csv')
MCA = MASS::mca(chairs[,-c(1,2,3)])
chairs = cbind(chairs, MCA$rs)
variables = as_data_frame(MCA$cs)
variables$var_names = rownames(MCA$cs)
chairs %>% 
  ggplot(aes(`1`, `2`))+
  geom_point(aes(color = Category))+
  stat_ellipse(aes(color = Category))+
  geom_text(data = variables, aes(`1`, `2`, label = var_names), size = 5)+
  theme_bw(base_size = 24)+
  scale_x_continuous(limits = c(-0.02, 0.02)) 
