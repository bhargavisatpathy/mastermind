class Messages
  def game_intro
    "Welcome to MASTERMIND""\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play_intro
    "\nI have generated a beginner sequence with four elements made up of:" + red('(r)ed') + ", \n" + green('(g)reen') + ", " + blue('(b)lue') + ", and " + yellow('(y)ellow') + ". Use (q)uit at any time to end the game.\nWhat's your guess?"
  end

  def game_instructions
    "Mastermind in play mode generates a secret color sequence of 4 four elements using:\n(r)ed, (g)reen, (b)lue, and (y)ellow. You have to guess the sequence.\nEach of your guess will display the number of matching colors and positions.\nWhen your guess matches with the secret sequence, you WIN."
  end

  def game_quit
    "Exiting the game."
  end

  def play_again
    "\nDo you want to (p)lay again or (q)uit?"
  end

  def game_win(code, guess_count, time)
    "Congratulations! You guessed the sequence #{code} in #{guess_count} guesses over #{time[0]} minutes #{time[1]} seconds."
  end

  def guess_again(input, match_colors_count, match_position_count, guess_count)
    "#{input} has #{match_colors_count} of the correct elements with #{match_position_count} in the correct positions.\nYou've taken #{guess_count} guess.\nEnter your guess:"
  end

  def not_a_valid_command
    "That's not a valid command."
  end

  def input_too_short
    "Guess is too short. Please enter a 4 letter guess."
  end

  def input_too_long
    "Guess is too long. Please enter a 4 letter guess."
  end

  def invalid_input
    "Invalid input. Please enter r g b y letters only."
  end

  def red(text)
    "\e[31m#{text}\e[0m"
  end

  def green(text)
    "\e[32m#{text}\e[0m"
  end

  def blue(text)
    "\e[34m#{text}\e[0m"
  end

  def yellow(text)
    "\e[33m#{text}\e[0m"
  end
end
