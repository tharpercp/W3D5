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

    



   
   
   
   
   
   
   
   
   

    attr_reader :parent, :children, :value



end