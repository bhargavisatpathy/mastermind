gem 'minitest' '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'

require_relative '../lib/game'

class GameTest < Minitest::Test
  def test_user_interaction
    instream = Minitest::Mock.new
    outstream = Minitest::Mock.new
    messages = Messages.new
    game = Game.new(ui)
    ui.expect(:display, [], [Game::WELCOME_MESSAGE])
    ui.expect(:read, [:quit], [])
    game.play
    ui.verify
  end
end
