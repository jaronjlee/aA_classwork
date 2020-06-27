# my_min
# Given a list of integers find the smallest number in the list.

# Example:
#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5

# Phase I
# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?


def my_min(arr)
    (0...arr.length).each do |i| # outer loop happens N times
        return arr[i] if (0...arr.length).all? do |j| # inner loop happens N times 
            arr[i] <= arr[j] # O(1)
        end
    end
end

#O(N)*O(N)*O(1) = O(N^2)

# Phase II
# Now rewrite the function to iterate through the list just once while keeping 
# track of the minimum. What is the time complexity?

def my_min_2(arr)
    min = arr[0] # O(1)
    arr.each do |el| #loop runs N times 
        min = el if el < min # O(1) 
    end
    min # O(1) 
end

#O(1) + N * O(1) + O(1)  = O(N+2) = O(N)


# testing 
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# p my_min_2(list)  # =>  -5








# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) 
# sub-sum. Find the sums of all contiguous sub-arrays and return the max.


# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.
# Discuss the time complexity of this solution.

def largest_contiguous_subsum(arr)
    sub_arrs = []
    (0...arr.length).each do |i| #N times 
        (i...arr.length).each do |j| #up to N times
            sub_arrs << arr[i..j]  #slice arr up to size N 
        end
    end
    sums = sub_arrs.map {|subarr| subarr.sum} # N^2 times up to N work ; N^2 space space for sums
    sums.max # N 
end

# time: N^3 + N^2 + N = O(N^3)  // (N^k) where k>1 polynomial  
# (2^N or 3^N) exponential 
# 
# each arr[i..j] -> has up to size N
# we are creating N^2 of those subarrays -> so N^3 total space for sub_arrs
# total: N^2 + N^3 
# space : O(N^3)



# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. 
# One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.
# Get your story straight, and then explain your solution's time complexity to your TA.

def largest_contiguous_subsum_2(arr)
    largest_sum = arr[0] # -1/0.0 
    current_sum = 0
    (0...arr.length).each do |i| # how much memory does range use?
        current_sum = 0 if current_sum < 0 # dropping all previous sum if negative
        current_sum += arr[i] # always try to include current element
        largest_sum = current_sum if current_sum > largest_sum #save if largest so far
    end
    largest_sum 
end

# time: O(N) = loop runs N times; each time does O(1) work
# space/memory: O(1)  
# testing

list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
p largest_contiguous_subsum_2(list) # => 8
# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

# Example 2:
list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum_2(list) # => 8 (from [7, -6, 7])
# Example 3:
list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])
p largest_contiguous_subsum_2(list) # => -1 (from [-1])
