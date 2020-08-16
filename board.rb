class Board
    attr_accessor :generated

    def initialize(moves = [])
        @generated = generate_board(moves)
    end

    def generate_board(moves)
        board = []

        for i in 0..7
            arr = []

            for j in 0..7
                arr << ' '
            end

            board << arr
        end

        moves.each_with_index do |move, idx|
            y = move[0]
            x = move[1]

            board[y][x] = "#{idx+1}"
        end

        board
    end
end