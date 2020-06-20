require_relative "00_tree_node.rb"


class KnightPathFinder
    attr_reader :considered_positions

    def self.valid_moves(pos)
        r, c = pos
        possible_moves = [
            [r-2,c-1],
            [r-2, c+1],
            [r-1, c+2],
            [r+1, c+2],
            [r+2, c+1],
            [r+2, c-1],
            [r+1, c-2],
            [r-1, c-2],
        ]
        possible_moves.select do |pos| 
            (0..7).include?(pos[0]) && (0..7).include?(pos[1])
        end
    end

    def initialize(pos) #[1,2]
        @root = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_positions = valid_moves.select { |pos| !@considered_positions.include?(pos) }
        @considered_positions += new_positions
        new_positions
    end

    def build_move_tree
        queue = [@root]
        until queue.empty?
            temp = queue.shift #root is shifted => node1 with value=[0,0]
            # return temp if temp.value == target #[7,7]
            children = new_move_positions(temp.value).map! {|pos| PolyTreeNode.new(pos, temp) }
            queue += children
        end
        @considered_positions
    end

    #possible moves for [0,0] => [[1, 2], [2, 1]]

end


#      0 1 2 3 4 5 6 7
#    0 _ _ _ _ _ _ _ _ 
#    1 _ _ 1 _ 2 _ _ _ 
#    2 _ 8 _ X _ X _ _ 
#    3 _ _ X _ _ _ X _ 
#    4 _ 7 _ _ K 4 _ _ 
#    5 _ _ X _ 5 _ X _ 
#    6 _ _ _ X _ X _ _ 
#    7 _ _ _ _ _ _ _ _ 

# [7, 7]

