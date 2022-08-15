module Player_class
    class Player
        attr_accessor :letter_guess, :letters_guessed, :word_guess, :tries

        def initialize
            @letter_guess = ""
            @letters_guessed = []
            @word_guess = []
            @tries = 8
        end

    end
end