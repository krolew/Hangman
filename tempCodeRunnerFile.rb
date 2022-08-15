class Computer
    def initialize
        @secret_word = select_secret_word
    end

    def select_secret_word
        file = File.open("dictionary.txt", "r").readlines(chomp: true)

        secret_words = file.select { |word| word.length >= 5 && word.length <= 12}

        puts secret_words
        secret_words
    end
end

computer = Computer.new
p computer
