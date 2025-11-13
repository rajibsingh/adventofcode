odd_squares = [x**2 for x in range(1, 649000) if x % 2 != 0]
sum_odd_squares = sum(odd_squares)
print(sum_odd_squares)
