class Array

  def my_uniq
    result = []
    self.each do |ele|
      result << ele unless result.include?(ele)
    end
    result
  end

  def two_sum
    result = []
    (0...self.length-1).each do |i| 
        (i+1..self.length-1).each do |j|
            result << [i,j] if self[i] + self[j] == 0
        end
    end 
    result
  end
end

def my_transpose(matrix)
  height = matrix.length
  width = height

  result = Array.new(height) { Array.new(width) }
  (0...height).each do |row|
    (0...width).each do |col|
      result[col][row] = matrix[row][col]
    end
  end
  result
end

def stock_picker(stocks)
    profits = {}

    (0...stocks.length-1).each do |i|
        (i+1...stocks.length).each do |j|
            profit = stocks[j] - stocks[i]
            profits[profit] = [i,j]
        end
    end

    max_profit = profits.keys.max
    return profits[max_profit]
end


# [ [1, 2, 3], [], [] ]
#move: expects only 1 disc to move to another pile
#total number of elements (discs) does not change
#won? array[0],array[1] are empty && array.last == array.last.sort
#subarrays always need to == sorted versions of themselves

class Hanoi
    attr_accessor :piles

    def initialize(size)
        @piles = Array.new(3) { Array.new(size) }
        @piles[0] = (0...size).to_a
    end

    def move(arr)
        first, second = arr[0], arr[1]
        @piles[second].unshift(piles[first].shift)
    end

    def won?
      return false unless @piles[0].empty?
      return false unless @piles[1].empty?
      return false if piles[2] != piles[2].sort
      true
    end
end