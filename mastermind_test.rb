class Mastermind
  COLORS = {
    "1" => "\e[41m 1 \e[0m", # red
    "2" => "\e[42m 2 \e[0m", # green
    "3" => "\e[44m 3 \e[0m", # blue
    "4" => "\e[43m 4 \e[0m", # yellow
    "5" => "\e[45m 5 \e[0m", # purple
    "6" => "\e[46m 6 \e[0m",  # cyan
  }
  FEEDBACK_COLORS = {
    white: "\e[47m o \e[0m",
    red: "\e[41m o \e[0m",
  }
  CODE_LENGTH = 4 # Number of pins in the secret code

  def initialize
    # Initialize secret code
    @secret_code = Array.new(CODE_LENGTH) { COLORS.keys.sample }
  end

  def play
    puts "Welcome to Mastermind!"
    puts "Do you want to be the creator of the secret code or the guesser?"
    puts "1. Creator"
    puts "2. Guesser"

    choice = gets.chomp

    case choice
    when "1"
      create_secret_code
      computer_play
    when "2"
      @secret_code = Array.new(CODE_LENGTH) { COLORS.keys.sample }
      player_play
    else
      puts "Invalid choice. Exiting game."
    end
  end

  def create_secret_code
    puts "Enter your secret code of four colors using numbers (e.g. 1234):"
    COLORS.each { |number, color| print "#{color}" }
    puts
    @secret_code = gets.chomp.split("")

    # Validate the player's secret code
    until valid_guess?(@secret_code)
      puts "Invalid code. Make sure to enter #{CODE_LENGTH} numbers from the list: #{COLORS.keys.join(", ")}"
      @secret_code = gets.chomp.split("")
    end
  end

  def computer_play
    10.times do |attempt|
      computer_guess = Array.new(CODE_LENGTH) { COLORS.keys.sample }
      puts "Computer's attempt #{attempt + 1}: "
      display_code(computer_guess)
      feedback = generate_feedback(computer_guess)

      if feedback[:red] == CODE_LENGTH
        puts "\nThe computer guessed your secret code!"
        return
      else
        display_feedback(feedback)
      end
    end

    puts "The computer couldn't guess your secret code!"
  end

  def player_play
    puts "Select colors using numbers:"
    COLORS.each { |number, color| print "#{color}" }
    puts "\nEnter your four color guess (e.g. 1234) or 'exit' to quit."

    10.times do |attempt|
      # Get guess from user
      print "Attempt #{attempt + 1}: "
      guess = gets.chomp.split("")

      # Exit if user types 'exit'
      if guess.join == "exit"
        display_code(@secret_code)
        puts " was the secret code."
        return
      end

      if valid_guess?(guess)
        display_code(guess)
        feedback = generate_feedback(guess)

        if feedback[:red] == CODE_LENGTH
          puts "\nCongratulations! You guessed the secret code."
          return
        else
          display_feedback(feedback)
        end
      else
        puts "Invalid guess. Make sure to enter #{CODE_LENGTH} numbers from the list: #{COLORS.keys.join(", ")}"
      end
    end

    display_code(@secret_code)
    puts " was the secret code."
  end

  def valid_guess?(guess)
    guess.length == CODE_LENGTH && guess.all? { |number| COLORS.key?(number) }
  end

  def display_code(code)
    code.each { |number| print COLORS[number] }
  end

  def display_feedback(feedback)
    print "\nWhite (correct color, incorrect position): "
    feedback[:white].times { print FEEDBACK_COLORS[:white] }

    print "\nRed (correct color, correct position)"
    feedback[:red].times { print FEEDBACK_COLORS[:red] }
    puts "\n"
  end

  def generate_feedback(guess)
    feedback = { white: 0, red: 0 }

    # Create temporary copies of the secret code and guess
    temp_secret = @secret_code.dup
    temp_guess = guess.dup

    # Check correct colors on correct positions (red pins)
    guess.each_with_index do |number, index|
      next unless number == @secret_code[index]

      feedback[:red] += 1
      temp_secret[index] = nil
      temp_guess[index] = nil
    end

    # Check correct colors on incorrect positions (white pins)
    temp_guess.compact.each do |number|
      if index = temp_secret.index(number)
        feedback[:white] += 1
        temp_secret[index] = nil
      end
    end

    feedback
  end
end

game = Mastermind.new
game.play
