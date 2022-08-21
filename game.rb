require_relative "Computer.rb"
require_relative "Player.rb"
require_relative "text_content.rb"
require_relative "game_config.rb"
require "json"

class Game
    include Computer_class
    include Player_class
    include Game_config
    include TextContent


    def initialize
        @computer = Computer.new
        @player = Player.new

        # to get Player.word_guess = ["_","_","_","_","_"]
        @computer.secret_word.length.times { @player.word_guess.push("_")}
    end

    def play
        game_selection_text
        game_mode = get_gamemode

        start_game if game_mode == "1"
        load_game if game_mode == "2"
    end

    def start_game
        until end_game
            incorrect_guess_info
            show_template_secret_code
            game_instruction
            letter_guess = get_letter_guess
            if letter_guess != "save"
                check_correct_guess(letter_guess)
                info_about_guess(letter_guess)
            else
                @player.letter_guess = letter_guess
                save_file
            end
        end
    end


    def load_game
        show_games
        choose_game_info
        game = get_game_name
        from_json(game)
        letters_guessed_info
        start_game
    end

end

Game.new.play