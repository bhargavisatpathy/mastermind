gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'

require_relative '../lib/game'
require_relative '../lib/messages'
require_relative '../lib/code_maker'

class GameTest < Minitest::Test

  def test_play_negative
    instream = Minitest::Mock.new
    outstream = Minitest::Mock.new
    messages = Messages.new
    game = Game.new(instream, outstream, messages)
    outstream.expect(:puts, [], [messages.play_intro])
    instream.expect(:gets, "rrg", [])
    outstream.expect(:puts, [], [messages.input_too_short])
    instream.expect(:gets, "rrggb", [])
    outstream.expect(:puts, [], [messages.input_too_long])
    instream.expect(:gets, "1edb", [])
    outstream.expect(:puts, [], [messages.invalid_input])
    instream.expect(:gets, "q", [])
    outstream.expect(:puts, [], [messages.game_quit])
    assert_equal 1, game.play
    outstream.verify
  end

  # def test_play_positive
  #   instream = Minitest::Mock.new
  #   outstream = Minitest::Mock.new
  #   messages = Messages.new
  #   codemaker = Minitest::Mock.new
  #   game = Game.new(instream, outstream, messages, codemaker)
  #   outstream.expect(:puts, [], [messages.play_intro])
  #   match_outcome =  MatchOutcome.new({match_colors_count: 4, match_position_count: 4})
  #   codemaker.expect(:match, match_outcome, ["rrgb"] )
  #   codemaker.expect(:code_length, 4, [] )
  #   codemaker.expect(:code, "rrgb", [] )
  #   instream.expect(:gets, "rrgb", [])
  #   outstream.expect(:puts, [], [messages.game_win("rrgb", 0, 0, 0)])
  #   game.play
  #   instream.verify
  #   codemaker.verify
  # end
end
