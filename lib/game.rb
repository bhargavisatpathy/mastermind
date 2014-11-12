require_relative 'code_maker'
require_relative 'messages'

class Game

  attr_reader :codemaker, :messages, :instream, :outstream
  attr_accessor :guess_count, :input

  def initialize(instream, outstream, messages, codemaker = CodeMaker.new)
    @instream     = instream
    @outstream    = outstream
    @guess_count  = 0
    @codemaker    = codemaker
    @messages     = messages
    @input        = ""
  end

  def play
    # game flow
    outstream.puts(messages.play_intro)
    start_time = Time.new

    loop do

      @input = instream.gets.strip.downcase
      case
      when quit?
        outstream.puts(messages.game_quit)
        return 1

      when input_too_short?
        outstream.puts(messages.input_too_short)

      when input_too_long?
        outstream.puts(messages.input_too_long)

      when invalid_input?
        outstream.puts(messages.invalid_input)

      else
        match_outcome = codemaker.match(input)
        if match_outcome.match_position_count == codemaker.code_length # exact match
          end_time = Time.new
          minutes = ((end_time - start_time) / 60).floor
          seconds = ((end_time - start_time) % 60).floor
          #MatchOutcome.new({match_colors_count: match_colors(guess), match_position_count: match_position(guess)})
          outstream.puts(messages.game_win(codemaker.code, @guess_count + 1, minutes, seconds))
          break
        else
          @guess_count += 1
          outstream.puts(messages.guess_again(
              input, match_outcome.match_colors_count,
              match_outcome.match_position_count,
              guess_count))
        end
      end
    end

  end

  def quit?
    input == 'q' || input == 'quit'
  end

  def input_too_short?
    input.length < 4
  end

  def input_too_long?
    input.length > 4
  end

  def invalid_input?
    input.match(/^[r|g|b|y]{4}$/) == nil
  end

end
