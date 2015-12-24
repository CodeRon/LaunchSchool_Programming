require 'colorize'

VALID_CHOICES = %w(rock paper scissors)

def test_message
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  human_choice = ""
  loop do
    prompt("Choose: #{VALID_CHOICES.join('/')}")

    human_choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(human_choice)
      break
    else
      prompt("*** Choice error! ***")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("Your choice: #{human_choice}.  Computer choice: #{computer_choice}.")

  if (human_choice == 'rock' && computer_choice == 'scissors') ||
     (human_choice == 'scissors' && computer_choice == 'paper') ||
     (human_choice == 'paper' && computer_choice == 'rock')
    prompt("You win!".green)
  elsif (human_choice == 'scissors' && computer_choice == 'rock') ||
        (human_choice == 'paper' && computer_choice == 'scissors') ||
        (human_choice == 'rock' && computer_choice == 'paper')
    prompt("Computer wins!".red)
  else
    prompt("Tie game!".blue)
  end

  prompt("Would you like to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for playing - - see you next time!")
