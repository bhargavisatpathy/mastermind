gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'game'

class Mastermind
  def initialize
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def input
    ui = UserInterface.new
    loop do
      answer = ui.read
      case answer
      when 'i', 'instructions'
        ui.display("instructions")
      when 'p', 'play'
        game = Game.new
        play_outcome = game.play
        if !play_outcome.success
          break
        else
          puts "Congratulations! You guessed the sequence #{game.codemaker.code} in #{play_outcome.guess_count} guesses over #{play_outcome.time}.\nDo you want to (p)lay again or (q)uit?"
        end
      when 'q', 'quit'
        break
      else
        puts "Please enter valid input.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
      end
    end
  end
end

mastermind = Mastermind.new
mastermind.input
