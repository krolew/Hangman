module Computer_class
    class Computer
        attr_reader :secret_word

        def initialize
            @secret_word = select_secret_word
        end

        def select_secret_word
            file = File.open("dictionary.txt", "r").readlines(chomp: true)

            secret_words = file.select { |word| word.length >= 5 && word.length <= 12}

            secret_word = secret_words[rand(0..secret_words.length-1)]
        end
    end
end



