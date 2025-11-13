fibonacci_sequence = [1, 2]
while True:
    next_fib = fibonacci_sequence[-1] + fibonacci_sequence[-2]
    if next_fib > 4000000:
        break
    fibonacci_sequence.append(next_fib)
even_fibonacci_sum = sum(x for x in fibonacci_sequence if x % 2 == 0)
print(even_fibonacci_sum)