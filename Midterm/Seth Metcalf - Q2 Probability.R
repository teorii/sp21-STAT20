# I pick 3 books without looking. What is the chance that I get at least one book with a soft cover?
# Chance of soft cover is 4/10, take the complement of getting 0 books in order to find AT LEAST 1.
1 - dbinom(0, 3, 4/10)

# I pick 4 books without looking. What is the chance that I get exactly 2 books with hard covers?
# Chance of hard cover is 6/10
dbinom(2, 4, 6/10)

# Find the expected value for the number of red books that are picked by the 50 people.
# Either a book is not red (0) or it is red (1)
bookbox = c(0, 0, 0, 0, 0, 1, 1, 1, 1, 1)
# EV = #draws * mean of the numbers in box
evbooks = 50 * mean(bookbox)

# Out of the 50 books in the previous problem, find the standard error for the number of red books.
# Have to account for R sd() using N-1 instead of just N
sdbooks = sd(bookbox) * sqrt((length(bookbox) - 1)/length(bookbox))
# SE = sqrt(draws) * sd of the box
sesum = sqrt(50) * sdbooks

# Write R code to use normal approximation to find the chance in the previous problem.
# Z score equation = ((Value - EV)/SE)
zscorebooks = (19.5 - evbooks)/sesum
# Take complement to find at least 20 books instead of 19 and below
1 - pnorm(zscorebooks)
