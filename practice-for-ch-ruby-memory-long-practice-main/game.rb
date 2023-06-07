require_relative 'board.rb'; require_relative 'card.rb'

class Game

    def initialize(size)
        @size = size
        @board = Board.new(size)
        @prev_guessed_pos = nil
    end

    attr_reader :size, :board

    def play
        @board.populate

        x = 0
        while !@board.won?
            system("clear")
            @board.render
            pos = [1,1,1,1,1,1]
            while !valid?(pos)
                # system("clear")
                puts "Please enter a position"
                pos = gets.chomp.split.map(&:to_i)
                # puts pos
            end
            @board.reveal(pos)
            # @board.render
            self.make_guess(pos)
            x += 1
        end

        system("clear")
        @board.render
        puts "Well done! It has taken you #{x} tries."
        sleep(3)
        puts "Want to play again? Enter 'y' or 'n'"
        if gets.chomp == 'y'
            puts "Enter a board size (must be even)"
            Game.new(gets.chomp.to_i).play
        else
            return
        end


    end

    def valid?(pos)
        (pos.length == 2) && pos.all?{|el| el >= 0 && el < @size}
    end


    def make_guess(pos)
        if !@prev_guessed_pos
            @prev_guessed_pos = pos

            # @board[pos].reveal
        else
            if !(@board[@prev_guessed_pos].face_value == @board[pos].face_value)
                #  wait a certain amount of time
                @board.reveal(pos)

                system("clear")
                @board.render
                sleep(3)

                @board[@prev_guessed_pos].hide
                @board[pos].hide

            end
            @prev_guessed_pos = nil
        end

    end


end

puts "Enter a board size (must be even)"
Game.new(gets.chomp.to_i).play
# ruby game.rb