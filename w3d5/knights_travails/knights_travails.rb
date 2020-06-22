require_relative "00_tree_node.rb"


class KnightPathFinder
    attr_reader :considered_positions, :root

    def self.valid_moves(pos)
        r, c = pos
        possible_moves = [
            [r-2,c-1],
            [r-2, c+1],
            [r-1, c+2],
            [r+2, c+1],
            [r+1, c+2],
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
        self.build_move_tree
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
            children.each { |child| temp.children << child } 
            queue += children
        end
        nil
    end

    # def find_path(target)
    #     return @root if @root.value == target
    #     @root.children.each do |child|
    #         child = KnightPathFinder.new(child.value)
    #         memo = child.find_path(target)
    #         return memo unless memo.nil?
    #     end
    #     nil
    # end

    def find_path(target)
        queue = [@root]
        until queue.empty?
            temp = queue.shift
            return trace_path_back(temp) if temp.value == target
            queue += temp.children
        end
        nil
    end

    def trace_path_back(node)
        result = [node]
        until result[0].parent.nil?
            new_parent = result[0].parent
            result.unshift(new_parent)
        end
        result
    end

    # def trace_path_back(node)
    #     result = [node]
    #     until result[0].parent.nil?
    #         node = node.parent
    #         result.unshift(node)
    #     end
    #     result
    # end

end

kpf = KnightPathFinder.new([0, 0])

p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]


#      0 1 2 3 4 5 6 7
#    0 X _ _ _ _ _ _ _ 
#    1 _ _ X _ _ _ _ _  
#    2 _ _ _ _ X _ _ _  
#    3 _ _ _ _ _ _ X _  
#    4 _ _ _ _ _ _ _ _  
#    5 _ _ _ _ _ X _ X  
#    6 _ _ _ _ _ _ _ _  
#    7 _ _ _ _ _ _ X _ 


#             [0, 0],
#     [1, 2],         [2, 1],
# [3, 1], [3, 3],    [0, 4],[2, 4],
# [2, 0],[0, 2],
