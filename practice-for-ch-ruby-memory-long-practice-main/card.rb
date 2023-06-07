
"""
## Card

A `Card` has two useful bits of information: 1) its face value and 2) whether it
is face-up or face-down. You'll want instance variables to keep track of this
information. You'll also want a method to display information about the card:
nothing when face-down, or its value when face-up. You'll also find it helpful
to write `#hide`, `#reveal`, `#to_s`, and `#==` methods.

Common problem: Having issues with `#hide` and `#reveal`? Review the Testing
Small (from Memory Puzzle) reading in the sidebar.
"""

class Card

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    attr_reader :face_value
    attr_accessor :face_up

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    # def revealed?
    #     return @face_up
    # end

    def to_s
        return self.face_value
    end

    def ==(val)
        self.face_value == val
    end



end
