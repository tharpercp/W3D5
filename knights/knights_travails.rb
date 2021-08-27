
class KnightPathFinder
    
    attr_reader root_node:

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
        
        
        return new_positions

    end


    def initialize(position)
        root_node = PolyTreeNode.new(position)
        self.build_move_tree
    end

    def build_move_tree
    
    end

    def find_path

    end