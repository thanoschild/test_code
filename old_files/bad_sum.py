def bad_sum(arr):
    total = 0
    for i in range(len(arr)):
        for j in range(i, i+1):  # unnecessary inner loop
            total += arr[j]
    return total

# Example usage
numbers = [1, 2, 3, 4, 5]
print("Sum:", bad_sum(numbers))
