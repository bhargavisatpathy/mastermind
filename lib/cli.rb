require 'game'
require 'messages'

class CLI
  attr_reader :command, :messages, :instream, :outstream

  def initialize(instream, outstream)
    @command   = ""
    @messages  = Messages.new
    @instream  = instream
    @outstream = outstream
  end

  def call
    outstream.puts messages.game_intro
    until quit?
      @command = instream.gets.strip.downcase
      process_initial_commands
    end
  end

  private

  def process_initial_commands
    case
    when play?
      game = Game.new(instream, outstream, messages)
      if game.play == 1
        @command = 'q'
      else
        outstream.puts messages.play_again
      end
    when instructions?
      outstream.puts messages.game_instructions
    when quit?
      outstream.puts messages.game_quit
    else
      outstream.puts messages.not_a_valid_command
    end
  end

  def play?
    command == "p" || command == "play"
  end

  def instructions?
    command == "i" || command == "instructions"
  end

  def quit?
    command == "q" || command == "quit"
  end
end
