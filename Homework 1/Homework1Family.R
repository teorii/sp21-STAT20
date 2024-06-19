file.choose()
family = read.csv("C:\\Users\\sethc\\Documents\\STAT20\\Homework 1\\family.csv")

rm(x)

meanheight = mean(family$height)

attach(family)
sortedfamily = family[order(age),]
sortedfamily$weight

