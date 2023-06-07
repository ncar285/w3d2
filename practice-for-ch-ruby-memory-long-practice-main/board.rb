require_relative "card.rb"

class Board

    def initialize(size=6)
        @size = size
        @grid  = Array.new(size){Array.new(size," ")}       #

    end

    attr_reader :grid

    def populate
        num_pairs = @size * @size / 2
        alpha = ('A'..'Z').to_a
        (0...num_pairs).each do 
            temp = alpha.sample
            alpha.delete(temp)
            i = 0
            while i < 2
                pos = [rand(0...@size),rand(0...@size)]
                if self[pos] == " "
                    self[pos] = Card.new(temp) 
                    i += 1
                end
            end
        end
    end

    def print
        @grid.each do |row|
            puts row.map{|card| card.face_value}.join("    ")
            puts "\n"
        end
    end

    def render
        @grid.each do |row|
            puts row.map {|card| card.face_up ? card.face_value : " "}.join("    ")
            puts "\n"
        end
    end

    def won?
        @grid.flatten.all? {|card| card.face_up}
    end

    def reveal(guessed_pos)
        # row, col = guessed_pos
        # p guessed_pos
        if !self[guessed_pos].face_up
            self[guessed_pos].face_up = true
            self[guessed_pos].face_value
        end
    end

    

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

end
