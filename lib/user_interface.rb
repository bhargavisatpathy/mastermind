class UserInterface

  def display(output_message)
    puts output_message
  end

  def read
    gets.chomp.downcase 
  end
end
