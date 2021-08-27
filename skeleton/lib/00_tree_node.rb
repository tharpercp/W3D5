class PolyTreeNode

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        #if node.children.include?(self)
        @parent.children.delete(self) unless @parent.nil?
        @parent = node
        unless node.nil? || node.children.include?(self)
            node.children << self 
        end
    end

    def add_child(child_node)
        if !@children.include?(child_node)
            @children.push(child_node)
            child_node.parent = self
        end
    end

    def remove_child(child_node)
        raise "argument is not a child of this node" unless @children.include?(child_node)
        raise "node is not a child" if child_node.parent == nil
        self.children.delete(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        @children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]

        until queue.empty?
            first = queue.shift
            return first if first.value == target_value
            queue += first.children
        end
        
        nil
    end

    def inspect
        { value: @value }.inspect
    end
            
   

    attr_reader :parent, :children, :value



end