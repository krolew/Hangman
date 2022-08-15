require_relative "Computer.rb"
require_relative "Player.rb"
require_relative "text_content.rb"
require_relative "game_config.rb"


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
        new_game if game_mode == "1"
        load_game if game_mode == "2"
    end
end

Game.new.play