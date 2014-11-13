require './test/test_helper'
require 'minitest/mock'

require_relative '../lib/game'
require_relative '../lib/messages'
require_relative '../lib/code_maker'

class GameTest < Minitest::Test

  def test_play_negative
    #setup
    instream = Minitest::Mock.new
    outstream = Minitest::Mock.new
    messages = Messages.new
    game = Game.new(instream, outstream, messages)

    # Expectations
    outstream.expect(:puts, [], [messages.play_intro])
    instream.expect(:gets, "rrg", [])
    outstream.expect(:puts, [], [messages.input_too_short])
    instream.expect(:gets, "rrggb", [])
    outstream.expect(:puts, [], [messages.input_too_long])
    instream.expect(:gets, "1edb", [])
    outstream.expect(:puts, [], [messages.invalid_input])
    instream.expect(:gets, "q", [])
    outstream.expect(:puts, [], [messages.game_quit])

    #Execution
    assert_equal 1, game.play
    outstream.verify
  end

  def test_play_positive
    #setup
    instream = Minitest::Mock.new
    outstream = Minitest::Mock.new
    messages = Messages.new
    codemaker = Minitest::Mock.new
    timer = Minitest::Mock.new
    expected_match_outcome =  MatchOutcome.new({match_colors_count: 4, match_position_count: 4})
    game = Game.new(instream, outstream, messages, codemaker, timer)

    #Expectations
    outstream.expect(:puts, [], [messages.play_intro])
    codemaker.expect(:match, expected_match_outcome, ["rrgb"] )
    codemaker.expect(:code_length, 4, [] )
    codemaker.expect(:code, "rrgb", [] )
    timer.expect(:start_timer, [], [])
    timer.expect(:end_timer, [0,0], [])
    instream.expect(:gets, "rrgb", [])
    outstream.expect(:puts, [], [messages.game_win("rrgb", 1, [0,0])])

    #Execution
    game.play
    codemaker.verify
  end
end
