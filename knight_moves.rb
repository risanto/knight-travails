require_relative "board.rb"
require_relative "knight.rb"

def knight_moves(initial, destination)
    knight = Knight.new(initial)
    board = Board.new(knight, destination)

    board.generated
end

pp knight_moves([0,0],[1,2])