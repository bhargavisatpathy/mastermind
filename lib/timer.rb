class Timer

  attr_reader :start_time

  def start_timer
    @start_time = Time.new
  end
  def end_timer
    end_time = Time.new
    minutes = ((end_time - start_time) / 60).floor
    seconds = ((end_time - start_time) % 60).floor
    [minutes, seconds]
  end
end
