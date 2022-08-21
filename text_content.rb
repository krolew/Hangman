module TextContent
    def game_selection_text
        puts "+------------------------------------------------+"
        puts "|                                                |"
        puts "|  This is the HangMANNNNNNN! Would you like to: |"
        puts "|    1 Start a new game                          |"
        puts "|    2 Load a game                               |"
        puts "|                                                |"
        puts "+------------------------------------------------+"
        puts ""
        print "Type here: "

    end


    def game_mode_warning
        puts "Invalid data. Enter only 1 or 2"
    end

    def game_instruction
        print "\nGuess one letter, or enter 'save' to save progress: "
    end

    def incorrect_guess_info
        puts "Incorrect guess left: #{@player.tries}"
    end

    def show_template_secret_code
        puts "#{@player.word_guess.join("")}".bold.magenta
    end

    def good_guess_info
        puts "Good guess!".green
    end

    def bad_guess_info
        puts "Bad guess!".red
    end

    def letters_guessed_info
        puts "Letters guessed: #{@player.letters_guessed.join(" ").brown}"
    end

    def game_over_info
        puts "\nCorrect word: #{@computer.secret_word.red}"
        puts "Game over! :("
        puts "Try again later :)"

    end

    def game_win_info
        puts"#{@player.word_guess.join("").bold.magenta}"
        puts "\nGood Job! You GUESSED the word!!!!!".green
    end

    def choose_game_info
        print "\nChoose a game: ".bold.magenta
    end

    def propert_file_info
        puts "Write a proper file name!".red
    end

    def file_saved_info
        puts "File saved.".green
    end
end


class String
    def black;          "\e[30m#{self}\e[0m" end
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def brown;          "\e[33m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    def gray;           "\e[37m#{self}\e[0m" end

    def bg_black;       "\e[40m#{self}\e[0m" end
    def bg_red;         "\e[41m#{self}\e[0m" end
    def bg_green;       "\e[42m#{self}\e[0m" end
    def bg_brown;       "\e[43m#{self}\e[0m" end
    def bg_blue;        "\e[44m#{self}\e[0m" end
    def bg_magenta;     "\e[45m#{self}\e[0m" end
    def bg_cyan;        "\e[46m#{self}\e[0m" end
    def bg_gray;        "\e[47m#{self}\e[0m" end

    def bold;           "\e[1m#{self}\e[22m" end
    def italic;         "\e[3m#{self}\e[23m" end
    def underline;      "\e[4m#{self}\e[24m" end
    def blink;          "\e[5m#{self}\e[25m" end
    def reverse_color;  "\e[7m#{self}\e[27m" end
end
