class Board
    attr_accessor :generated

    def initialize(knight, destination)
        @generated = generate_board(knight, destination)
    end

    def generate_board(knight, destination)
        board = []

        for i in 0..7
            arr = []
            y_position, x_position = knight.position
            y_destination, x_destination = destination

            for j in 0..7
                if i == y_position && j == x_position
                    arr << 'K'
                elsif i == y_destination && j == x_destination
                    arr << 'D'
                else
                    arr << ' '
                end
            end

            board << arr
        end

        board
    end
end