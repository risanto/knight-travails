require_relative "board.rb"
require_relative "knight.rb"

def knight_moves(initial, destination)
    root = Knight.new(initial)
    node_list = [root]
    moves = []

    # Search through node_list, stop if there's destination on pos_moves

    until moves.include?(destination)
        node_list.each do |node|
            
            moves << node.position

            node.pos_moves.each do |pos_move|
                if pos_move.to_s == destination.to_s
                    moves << pos_move
                end

                # Endless recursion on this part
                node_list << Knight.new(pos_move, node)
            end
        end
    end

    node_list
end

# pp knight_moves([0,0],[1,2])
pp knight_moves([0,0],[3,3])