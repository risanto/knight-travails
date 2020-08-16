require_relative "board.rb"
require_relative "knight.rb"

def flatten(node, arr = [])
    return arr if node == nil

    flatten(node.parent, arr)
    arr << node.position
end

def knight_moves(initial, destination)

    if initial[0] < 0 || initial[1] > 7 || destination[0] < 0 || destination[0] > 7
        return "Invalid initial/destination position!"
    end

    root = Knight.new(initial)
    node_list = [root]
    moves = []
    trimmed_moves = []

    # Search through node_list, stop if there's destination on pos_moves

    until moves.include?(destination)
        node_list.each do |node|
            destination_found = false
            moves << node.position

            node.pos_moves.each do |pos_move|
                if pos_move.to_s == destination.to_s
                    destination_found = true
                    moves << pos_move
                end

                node_list << Knight.new(pos_move, node)
            end

            break if destination_found
        end
    end

    node_list = node_list.select { |node| node.position.to_s == destination.to_s }

    node_list.each do |node|
        moves = flatten(node) if flatten(node).length < moves.length
    end

    puts "\n \n"

    puts "You made it in #{moves.length} moves! Here's your path: \n"

    moves.each do |move|
      print "\n#{move}"
    end

    puts "\n \n"

    pp Board.new(moves).generated
end

knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])
knight_moves([3,3],[0,0])
knight_moves([4, 4], [8, 8])
knight_moves([4, 4], [1, 0])