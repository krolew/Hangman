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
        for i in 1..5 do
            game_instruction
            letter_guess = get_letter_guess
            if letter_guess != "save"
                check_correct_guess(letter_guess)
            else
                puts "Not working yet...."
                save_file
            end
        end
    end

    def get_letter_guess
        letter_guess = gets.chomp.downcase

        until !!(letter_guess =~ /^[a-zA-Z]{1}$/ || letter_guess == "save")
            game_instruction
            letter_guess = gets.chomp.downcase
        end
        letter_guess
    end

    def check_correct_guess(letter_guess)

        @computer.secret_word.split("").each_with_index do |secret_code_letter, index|
            if secret_code_letter == letter_guess
                @player.word_guess[index] = letter_guess
            end
        end
        @player.letters_guessed.push(letter_guess)
        p @computer
        p @player
    end
end