require './test/test_helper'

require_relative '../lib/timer'

class TimerTest < Minitest::Test
  def test_start_time
    timer = Minitest::Mock.new
    timer.expect(:start_timer, [], [])
    timer.expect(:end_timer, [0,0], [])
    timer.start_timer
    timer.end_timer
    timer.verify
  end
end
