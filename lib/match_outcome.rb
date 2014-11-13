class MatchOutcome
  attr_reader :match_colors_count, :match_position_count

  def initialize(data)
    @match_colors_count = data[:match_colors_count]
    @match_position_count = data[:match_position_count]
  end
end
