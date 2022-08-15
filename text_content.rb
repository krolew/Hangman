module TextContent
    def game_selection_text
        puts "This is a HangMANNNNNNN! Would you like to: "
        puts "1 Start a new game"
        puts "2 Load a game\n\n"
    end

    def game_mode_warning
        puts "Invalid data. Enter only 1 or 2"
    end

    def game_instruction
        puts "Guess one letter, or enter 'save' to save progress: "
    end
end