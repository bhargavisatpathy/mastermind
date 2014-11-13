require_relative 'match_outcome'
class CodeMaker
  COLORS = ["r", "g", "b", "y"]
  attr_reader :code, :code_length, :color_length

  def initialize
    @code_length  = 4
    @color_length = 4
    @code         = ""
    code_length.times { @code += COLORS[rand(0..color_length-1)] }
  end

  def match_colors(guess)
    count = 0
    COLORS.each do |color|
      count += [guess.count(color), code.count(color)].min
    end
    count
  end

  def match_position(guess)
    guess.chars.zip(code.chars).count { |x| x[0] == x[1] }
  end

  def match(guess)
    MatchOutcome.new({match_colors_count: match_colors(guess), match_position_count: match_position(guess)})
  end

end
