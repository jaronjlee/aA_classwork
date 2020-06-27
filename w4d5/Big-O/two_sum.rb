# two_sum?
# Given an array of unique integers and a target sum, determine whether any two 
# integers in the array sum to that amount.




def brute_force_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum 
        end
    end
    false
end

# time: O(N^2) -> checking all pairs 
# space: O(1)

# arr = [0, 1, 5, 7]
# arr = [0, 1, 5, 7]
# p brute_force_two_sum?(arr, 6) # => should be true
# p brute_force_two_sum?(arr, 10) # => should be false
# p brute_force_two_sum?(arr, 1) # => should be false


#arr = [-1,1] target = 0


def sorting_two_sum?(arr, target_sum)
    sorted = arr.sort # N log N 
    #[first,....,last]
    # first + last == target_sum ->  return true
    # first + last <  target_sum ->  shift off first
    # first + last >  target_sum ->  pop off last
    until sorted.length < 2  # until sorted.length < 1  # time: N
        if sorted[0] + sorted[-1] < target_sum
            sorted.shift
        elsif sorted[0] + sorted[-1] > target_sum
            sorted.pop
        else
            return true
        end
    end
    false
end

# time: O(N log N)
# space: O(N) but it could be O(1) if we did arr.sort! changed sorted to arr


# arr = [0, 1, 5, 7]
# p sorting_two_sum?(arr, 6) # => should be true
# p sorting_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target_sum)
    hash = {}
    #hash[0] = 0 #set value 
    #hash.has_key?(0) or hash[0] #lookup

    # see a 0 in arr -> later on if we ever see target_sum then we're done
    # see a 1 in arr -> later on if we ever see target_sum - 1 then we're done
    # see a 
end




# arr = [0, 1, 5, 7]
# hash = { 0:0, 1:1, 5:5 }
# target = 6

def hash_two_sum?(arr, target_sum)
    hash = {}
    arr.each do |ele|
        hash[ele] = ele
        return true if hash.has_key?(target_sum-ele)
    end
    false
end



arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false