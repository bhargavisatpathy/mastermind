class Messages
  def program_intro
    "Welcome to MASTERMIND""\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def game_intro
    "I have generated a beginner sequence with four elements made up of: (r)ed,
  (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n
  What's your guess?"
  end

  def game_instructions
    "Game instructions."
  end

  def game_command_request
    "Enter your guess: "
  end

  def game_quit
    "Exiting the game."
  end

  def play_again
    "Do you want to (p)lay again or (q)uit?"
  end

  def game_win(code, guess_count, time)
    "Congratulations! You guessed the sequence #{code} in
    #{guess_count} guesses over #{time}."

  end

  def guess_again(input, match_colors_count, match_position_count, guess_count)
    "#{input} has #{match_colors_count} of the correct elements with #{match_position_count} in the correct positions. \n
    You've taken #{guess_count} guess"
  end

  def not_a_valid_command
    "That's not a valid command." 
  end

  def input_too_short
    "Guess is too short. Please enter a 4 letter guess"
  end

  def input_too_long
    "Guess is too long. Please enter a 4 letter guess"
  end

  def invalid_input
    "Invalid input. Please enter r g b y letters only"
  end
end
