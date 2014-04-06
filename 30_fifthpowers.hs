-- Surprisingly there are only three numbers that can be written as the sum of
-- fourth powers of their digits:
--
--      1634 = 14 + 64 + 34 + 44
--      8208 = 84 + 24 + 04 + 84
--      9474 = 94 + 44 + 74 + 44
--
-- As 1 = 14 is not a sum it is not included.
--
-- The sum of these numbers is 1634 + 8208 + 9474 = 19316.
--
-- Find the sum of all the numbers that can be written as the sum of fifth powers
-- of their digits.

-- create a list of digits from an input
n_digits 0 = []
n_digits n = n `mod` 10 : n_digits (n `div` 10)
digits n = reverse(n_digits n)

size = 5  -- size of the power we're checking, fifth
power_sum x = sum([y ^ size | y <- x])

-- highest value it can be is 6*9^5, we can skip 1 as it
-- doesn't fit the definition of a sum
nums = [2..354294]

num_digits = [(x, digits x) | x <- nums]
sums = [(power_sum(snd x), x) | x <- num_digits]
valid = [s | s <- sums,
    length(digits(fst s)) == length(digits(fst(snd s))),
    fst(snd s) == fst s]

valid_sum = sum([fst n | n <- valid])

main = print $ valid_sum
