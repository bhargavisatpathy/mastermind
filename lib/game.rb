require_relative 'code_maker'
require_relative 'user_interface'

class Game
  WELCOME_MESSAGE = "I have generated a beginner sequence with four elements made up of: (r)ed,
  (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n
  What's your guess?"

  INPUT_TOO_SHORT = "Guess is too short. Please enter a 4 letter guess"

  INPUT_TOO_LONG = "Guess id too long. Please enter a 4 letter guess"

  INPUT_INVALID = "Invalid input. Please enter r g b y letters only"

  attr_reader :ui, :board, :codemaker
  attr_accessor :guess_count

  def initialize(user_interface = UserInterface.new)
    @ui = user_interface
    @guess_count = 0
    @codemaker = CodeMaker.new
  end

  def play # game flow
    ui.display(WELCOME_MESSAGE)
    start_time = Time.new
    loop do

      input = ui.read
      if input == 'q' || input == 'quit'
        return PlayOutcome.new
      elsif input.length < 4
        ui.display(INPUT_TOO_SHORT)

      elsif input.length > 4
        ui.display(INPUT_TOO_LONG)

      elsif input.match(/^[r|g|b|y]{4}$/) == nil
        ui.display(INPUT_INVALID)
      else
        match_outcome = codemaker.match(input)
        if match_outcome.match_position_count == codemaker.code_length # exact match
          return PlayOutcome.new(true, Time.new - start_time, self.guess_count + 1)
        else
          self.guess_count = self.guess_count + 1
          ui.display("#{input} has #{match_outcome.match_colors_count} of the correct elements with #{match_outcome.match_position_count} in the correct positions. \n
          You've taken #{guess_count} guess")
        end
      end
    end
  end
end

class PlayOutcome
  attr_reader :success, :time, :guess_count
  def initialize (success = false, time = 0, guess_count = 0)
    @success = success
    @time = time
    @guess_count = guess_count
  end
end

# game = Game.new
# game.play
