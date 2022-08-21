module Game_config
    def get_gamemode
        game_mode = gets.chomp

        until !!(game_mode=~ /^[1-2]{1}$/)
            game_mode_warning
            game_mode = gets.chomp
        end
        game_mode
    end


    def get_letter_guess
        letter_guess = gets.chomp.downcase

        until !!( (letter_guess =~ /^[a-zA-Z]{1}$/ && letter_non_repeated(letter_guess)) || letter_guess == "save")
            game_instruction
            letter_guess = gets.chomp.downcase
        end
        letter_guess
    end

    def letter_non_repeated(letter_guess)
        @player.letters_guessed.include?(letter_guess) ? false: true
    end

    def check_correct_guess(letter_guess)

        @computer.secret_word.split("").each_with_index do |secret_code_letter, index|
            if secret_code_letter == letter_guess
                @player.word_guess[index] = letter_guess
            end
        end
        @player.letters_guessed.push(letter_guess)
    end

    def info_about_guess(letter_guess)
        if(@player.word_guess.include?(letter_guess))
            good_guess_info
        else
            bad_guess_info
            decrease_tries
        end
        letters_guessed_info
    end

    def decrease_tries
        @player.tries -= 1
    end

    def end_game
        if @player.tries == 0
            incorrect_guess_info
            game_over_info
            true
        elsif @player.word_guess.join("") == @computer.secret_word
            game_win_info
            true
        elsif @player.letter_guess == "save"
            file_saved_info
            true
        end
    end

    def save_file
        Dir.mkdir("saved_games") unless Dir.exist?("saved_games")

        puts "Enter a file name: "

        name_of_file = gets.chomp

        filename = "saved_games/#{name_of_file}.json"

        File.write(filename, to_json)

    end

    def to_json
        JSON.dump({
            :letters_guess => @player.letters_guessed,
            :word_guess => @player.word_guess,
            :tries => @player.tries,
            :secret_word => @computer.secret_word
        })
    end

    def from_json(filename)
        filename = "saved_games/#{filename}.json"

        if File.exist?(filename)
            file = File.read(filename)
            data_hash = JSON.parse(file)
            load_game_data(data_hash)
        else
            puts "Coudn't find the file."
        end
    end

    def load_game_data(data_hash)
        @player.letters_guessed = data_hash["letters_guess"]
        @player.word_guess = data_hash["word_guess"]
        @player.tries = data_hash["tries"]
        @computer.secret_word = data_hash["secret_word"]
    end

    def show_games
        print "\n"

        Dir.mkdir("saved_games") unless Dir.exist?("saved_games")
        # create some games if the folder is empty

        if Dir.empty?("saved_games")
            Dir.chdir("saved_games") do
                File.write("sample_2.json", '{"letters_guess":["a","w","t"],"word_guess":["_","t","a","t","_"],"tries":7,"secret_word":"state"}')
                File.write("watch_out.json", '{"letters_guess":["a","e","i","o","u","p","m","c","d","t","j"],"word_guess":["a","t","t","e","_","d","e","d"],"tries":1,"secret_word":"attended"}')
                File.write("sample_1.json", '{"letters_guess":["s","a","z","v","n","m","w","e","t","y","u"],"word_guess":["n","_","m","_","n","a","t","_","_","n"],"tries":1,"secret_word":"nomination"}')
            end
        end
            games = Dir.chdir("saved_games") do
            Dir.entries(".").select {|f| File.file? f}.map{ |f| File.basename(f, ".json")}
            end

        puts games
    end

    def get_game_name
        games = Dir.chdir("saved_games") do
            Dir.entries(".").select {|f| File.file? f}.map{ |f| File.basename(f, ".json")}
        end

        game = gets.chomp

        until games.include?(game)
            propert_file_info
            choose_game_info
            game = gets.chomp
        end

        game
    end

end