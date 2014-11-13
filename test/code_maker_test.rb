require './test/test_helper'

require_relative '../lib/code_maker'

class CodeMakerTest < Minitest::Test

  def test_generate_a_secret_code
    codemaker = CodeMaker.new
    assert_match /^[r|g|b|y]{4}$/, codemaker.code
  end

  def test_give_feedback_for_exact_match
    codemaker = CodeMaker.new
    match_outcome = codemaker.match(codemaker.code)
    assert_equal codemaker.code_length, match_outcome.match_colors_count
    assert_equal codemaker.code_length, match_outcome.match_position_count
  end

  def test_give_feedback_for_partial_match
    codemaker = CodeMaker.new
    shuffled_code = codemaker.code.chars.shuffle.join('')
    match_outcome = codemaker.match(shuffled_code)
    assert_equal codemaker.code_length, match_outcome.match_colors_count
    refute_equal codemaker.code_length, match_outcome.match_position_count
end

end
