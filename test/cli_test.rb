require './test/test_helper'


require_relative '../lib/cli'

class CLITest < Minitest::Test
  def test_user_input_command
    instream = Minitest::Mock.new
    outstream = Minitest::Mock.new
    messages = Messages.new
    cli = CLI.new(instream, outstream)

    # Expectations
    outstream.expect(:puts, [], [messages.game_intro])
    instream.expect(:gets, "i", [])
    outstream.expect(:puts, [], [messages.game_instructions])
    instream.expect(:gets, "p", [])
    outstream.expect(:puts, [], [messages.play_intro])
    instream.expect(:gets, "q", [])
    outstream.expect(:puts, [], [messages.game_quit])

    #Execution
    cli.call
    outstream.verify
  end

end
