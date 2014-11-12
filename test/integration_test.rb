gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/cli.rb'
require_relative '../lib/game.rb'

class CLITest < MiniTest::Test

  def test_play
    game = game.new(instream, outstream, messages)

  end
end
