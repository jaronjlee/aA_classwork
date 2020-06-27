# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. 
# Check if the second string is one of these.
# Hints:
# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

def first_anagram?(str1,str2)
    # returns an enumerable -> enumerable is a module similar to class -> methods generate the next one 
    anagrams = str1.chars.permutation#.to_a  # string of n unique characters -> 
    # n! different permutations : n * n-1  * n-2 * ... * 1 
    return true if anagrams.include?(str2.chars) # == 
    false
end

# test
# p first_anagram?('abc', 'cab')


#str1.chars.permutation.to_a# -> generate the array of all anagrams -> there are N! anagrams, each takes up N space; 
#permutations = [1_anagram] -> [2_anagram]

#time : O(N!)
#space : str1.chars -> O(N) space; str2.chars -> O(M) space; 
# permutations -> O(N) space if 1 at a time but O(N * N!) if generated each separately
# O(N + M) if 1 at a time but O(N*N! + M) if separate/not re-using the same memory for each anagram


#anagrams: "baa", "aba", "aab"
#substrs: "", "a", "b" , "aa", "ab", "ba", "aba"
#anagrams: "abc" => ["abc", "acb", "bca", "bac", "cab", "cba"]

#"abcd" -> 24
#"abcde" -> 120






# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, 
# find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. 
# The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.
# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??


def second_anagram?(str1, str2)
    (0...str1.length).each do |i| #loop runs N times 
        char = str1[i]
        idx = str2.index(char) # O(M) work 
        return false if idx.nil?
        str2[idx] = ""
    end
    str2.empty?
end

# test
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# time: O(M*N)
#  M + M - 1 + M -2 + ... + 2 + 1 = O(M^2) #if M runs out first
#  M + M - 1 + ...  + M - N #if n runs out first
#  O(M*min(M,N))

# space : O(1)








# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
# The strings are then anagrams if and only if the sorted versions are the identical.
# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram?(str1,str2)
    sorted1 = str1.chars.sort
    sorted2 = str2.chars.sort
    sorted1 == sorted2 # compare element by element -> min(N,M) work 
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


#time : O( NlogN + MlogM)
#space: O(N+M) 





# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of 
# times each letter appears in both words. Compare the resulting hashes.
# What is the time complexity?
# Bonus: Do it with only one hash.


def bonus_anagram?(str1,str2)
    h1 = Hash.new(0)
    str1.each_char { |char| h1[char] += 1 } # O(N) time ; O(N) space
    str2.each_char { |char| h1[char] -= 1 } # O(M) time ; O(M) space
    h1.values.all? { |ele| ele == 0 } # ele.zero? # O(N) time 
end
# time: O(N + M)
# space: O(N + M)


def bonus2_anagram?(str1,str2)
    h1 = Hash.new(0)
    str1.each_char { |char| h1[char] += 1 } # O(N) time ; O(N) space
    str2.each_char do |char|
        h1[char] -=1
        return false if h1[char] < 0 #if value is negative then char from str2 is not in str1
    end
    h1.values.all? { |ele| ele == 0 } # ele.zero? # O(N) time 
end

# h = {'a' : 1, 'b' : 1, }

#time: O(N)
#space: O(N)



p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str1,str2)
    h1 = Hash.new(0)
    h2 = Hash.new(0)
    str1.each_char { |char| h1[char] += 1 } # O(N) time ; O(N) space
    str2.each_char { |char| h2[char] += 1 } # O(M) time ; O(M) space
    h1 == h2 # O(min(N,M)) time ; 
end


















# def anagram(str)
#     return [''] if str.empty? || str.nil?
#     first = str[0]
#     # if str = "a"
#     # then str[1..-1] = nil 
#     partial_anagrams = anagram(str[1..-1]) # array where each element is an anagram of the rest of str
#     total_anagrams = []
#     partial_anagrams.each do |partial|
#         (0..str.length).each do |i|
#             total_anagrams << [partial[0...i], first, partial[i..-1]].join
#         end
#     end
#     total_anagrams.uniq
# end

# p anagram('abc')