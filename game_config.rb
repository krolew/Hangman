module Game_config
    def get_gamemode
        game_mode = gets.chomp

        until !!(game_mode=~ /^[1-2]{1}$/)
            game_mode_warning
            game_mode = gets.chomp
        end
        game_mode
    end

    def new_game
        game_instruction
        letter_guess = get_letter_guess
    end

    def get_letter_guess
        letter_guess = gets.chomp.downcase

        until !!(letter_guess =~ /^[a-zA-Z]{1}$/ || letter_guess == "save")
            game_instruction
            letter_guess = gets.chomp.downcase
        end
        letter_guess
    end

    def
end