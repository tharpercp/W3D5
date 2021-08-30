
require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    
    attr_reader :root_node

    def self.valid_moves(position)
        new_positions = []
        x, y = position
        moves = [[2, 1],[-2,1],[2,-1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
        moves.each do |move|
            xa, ya = move
            if x + xa <= 7 && y + ya <= 7 && x + xa >= 0 && y + ya >= 0
                new_positions << [x + xa, y + ya]
            end
        end 
        new_positions
    end


    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        self.build_move_tree
    end

    def build_move_tree
        queue = [root_node]

        until queue.empty?
            current_node = queue.shift
            new_pos = new_move_positions(current_node.value)
            break if new_pos == nil
            new_pos.each do |position|
                new_node = PolyTreeNode.new(position)
                current_node.add_child(new_node)
                new_node.parent = current_node
                queue << new_node 
            end
        end
    end
        
    

        # until @considered_positions.empty?
        #     first = @considered_positions.shift
        #     self.new_move_positions(first)
        # end

    def new_move_positions(position)
        new_positions = KnightPathFinder.valid_moves(position).select do |move|
            !@considered_positions.include?(move)
        end

        @considered_positions += new_positions

        new_positions

    end

    def find_path
    end

end

test = KnightPathFinder.new([0,0])
p test.root_node