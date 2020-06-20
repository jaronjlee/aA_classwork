class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value, parent=nil)
        @value = value
        @parent = parent
        @children = []
    end

    def inspect
        p "#{self.value}"
    end

    def parent=(new_parent_node)
        previous_parent = self.parent
        previous_parent.children.delete(self) unless previous_parent.nil?
        @parent = new_parent_node
        return nil if @parent.nil?
        new_parent_node.children << self unless new_parent_node.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise if child_node.parent.nil?
        child_node.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            memo = child.dfs(target)
            return memo unless memo.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            temp = queue.shift
            return temp if temp.value == target
            queue += temp.children
        end
        nil
    end

end

# target = d
# [a] => a.value == target
# [] + [b,c]
# [b,c] => b.value == target
# [c,d,e] => c.value == target
# [d,e,f,g] => d.value == target
# return d

#      a
#    b   c
#   d e f g