mysd=function(x){sd(x)*sqrt((length(x)-1)/length(x))}
library(MASS)  # To do complicated simulations, you don't need to know
library(ggplot2)
library(dplyr)

# You don't have to understand the next line, it is to generate random data with
# specified mean, sd, and correlation.
data=data.frame(mvrnorm(n=1000, mu=c(0,0), Sigma = matrix(c(1,0.6,0.6,1),nrow=2),empirical=T))/mysd(data$X1)
# check that it worked
summary(data)
mysd(data$X1)
cor(data$X1,data$X2)

# now create midterm and final data, same summary statistics as lecture example
data=mutate(data,midterm=X1*12+71,final=X2*11+70)
r = cor(data$midterm, data$final)
sdx = mysd(data$midterm)
sdy = mysd(data$final)
avgx=mean(data$midterm)
avgy=mean(data$final)

ggplot(data,aes(x=midterm,y=final)) +
  geom_point(alpha=0.3,color="blue")  +
  geom_smooth(method="lm", se=F) # We'll learn this later

vertstrip=filter(data,abs(midterm-83)<0.3)
colmean=mean(vertstrip$final)

ggplot(data,aes(x=midterm,y=final)) +
  geom_point(alpha=0.1,color="blue")  +
  geom_point(data=filter(data,abs(midterm-83)<0.3),alpha=0.3,color="red") +
  geom_smooth(method="lm", se=F) +
  geom_point(aes(x=83, y=colmean), shape=3,size=5,color="orange") + # graph of averages in strip
  geom_point(aes(x=83, y=76.6), shape=4,size =5,color="green")  # on regression line


  
