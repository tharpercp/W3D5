
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
        
        first_moves = KnightPathFinder.valid_moves(@root_node.position)
           
        next_moves = []
        first_moves.each do |move|
            node = PolyTreeNode.new(move)
            @root_node.add_child(node)
            node.add_parent(@root_node)
            next_moves << move
        end

        next_moves

        queue = [next_moves]

        until queue.empty?
            queue.
        end

        
        KnightPathFinder.valid_moves(@root_node.position).each do |move|
            @root_node.add_child(move)
            move.add_parent(@root_node)
        end




        # until @considered_positions.empty?
        #     first = @considered_positions.shift
        #     self.new_move_positions(first)
        # end
    end

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