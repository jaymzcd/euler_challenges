#!/usr/bin/env/python2
from collections import defaultdict


def is_prime(x):
    """
        Niavely checks if a given 'x' is prime
    """
    if x % 2 == 0:
        return False
    for i in range(3, x, 2):
        if x % i == 0:
            return False
    return True


def sieve(n):
    """
        Creates a list of primes up to and including n via sieve technique
    """
    n = n + 1
    sieve = range(n)
    primes = defaultdict(bool)

    # Default our list to true - assume all are prime
    for x in sieve:
        primes[x] = True

    p = 2
    while p <= n and p ** 2 <= n:
        for c, n in enumerate(sieve[p::p]):
            if c == 0 and primes[n] == True:
                primes[n] = True
            else:
                primes[n] = False
        p += 1

    return [p for p in primes if primes[p] == True and p > 1]


def factorize(x):
    """
        Returns all factors for number x up to x
    """

    if x == 0:
        return []

    lim = x ** 0.5  # Only need to go up to this
    factors = []  # Init our list to return
    for i in range(1, int(lim) + 1):
        if x % i == 0:
            factors.append(i)  # The main factor
            factors.append(x / i)  # Add the 'inverse' factor

    factors = list(set(factors))  # Get uniques, then tidy up
    factors.sort()  # The set isn't always sorted
    factors.pop(-1)  # Remove last one which is x itself

    return factors


if __name__ == '__main__':
    pass

