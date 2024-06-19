# Numbered Tickets 1-4
ticketedbox = c(1:4)

# Possible two tickets drawn without replacement
# All possible outcomes: 3, 4, 5, 6, 7:
# 3 occurs 1/6 of the time
# 4 occurs 1/6 of the time
# 5 occurs 2/6 of the time
# 6 occurs 1/6 of the time
# 7 occurs 1/6 of the time

# Using X as defined in the previous problem, find E(X).
# Multiply their outcome by their probabilities to find the expected value
EofX = (3 * 1/6) + (4 * 1/6) + (5 * 2/6) + (6 * 1/6) + (7 * 1/6)

# Using X as defined in the previous problem, find SE(X).
# SE(X) = sqrt(E[(X - E(X))^2])
SEofX = sqrt(((3 - 5)^2 * (1/6)) + ((4 - 5)^2 * (1/6)) + ((5 - 5)^2 * (2/6)) + ((6 - 5)^2 * (1/6)) + ((7 - 5)^2 * (1/6)))

# For the rest of this problem, 30 draws are made WITH REPLACEMENT. Find the expected value of the sum of the 30 draws.
# All possible outcomes: 2, 3, 4, 5, 6, 7, 8:
EVticketed = mean(ticketedbox) * 30
# Because of this, we know that the EV is 75

# SE of the draws
# Take sd of box
SDticketed = sd(ticketedbox) * sqrt((length(ticketedbox) - 1)/length(ticketedbox))
# SE = sqrt(draws) * sd of the box
SEticketed = sqrt(30) * SDticketed

# Write R code to find the chance that the sum of the 30 draws is 65 or more.
# Since we know that the SE = 6.123724 and the EV = 75, we can use this to find z-score
value = 64.5
Zticketed = ((value - EVticketed)/SEticketed)
# We know it is a discrete histogram because the sum of the draws can not be a decimal, so we use 64.5
# Take the complement of the pnorm so find everything ABOVE that value
CHticketed = 1 - pnorm(Zticketed)
