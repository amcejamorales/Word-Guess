require "colorize"

# class Image generates beating heart
class Image
  attr_writer :num_attempts
  def initialize
    @num_attempts = 5
    @heart_parts = ["  ,d88b.d88b,  ", "  88888888888  ", "  `Y8888888Y'  ", "    `Y888Y'    ", "      `Y'      "]

  end

  def print_heart
    loser_img = ""
    @num_attempts.times do |attempt|
      loser_img += "#{@heart_parts[attempt]}".blue.on_red.blink
      loser_img += "\n"
    end
    (5 - @num_attempts).times do
      loser_img += "               ".blue.on_red.blink
      loser_img += "\n"
    end
    return loser_img

  end
end

# class Game logic runs game
class Game

  attr_accessor :word, :word_split

  def initialize
    @words = ["apple", "coconut", "carrot", "skein", "metronome"]
    @attempts = 5
    @image = Image.new
    @word = @words.sample
    @word_split = @word.split('')
    @word_in_progress = Array.new(@word.length, "_ ")
  end

  def round
    # get word length
    # loop through word length and puts "_" that many times
    while @attempts != 0 && @word_split != @word_in_progress
      puts "\n"
      print "Guess a letter: "
      puts @word_in_progress.join
      user_input = gets.chomp
      until /[a-z]+/.match(user_input)
        puts "Guess a letter: "
        user_input = gets.chomp

      end

      # updates word if user guesses letter correctly
      if @word_split.include?(user_input)
        # does something
        user_input_indices = @word_split.each_index.select {|i| @word_split[i] == user_input}

        user_input_indices.each do |index|
          @word_in_progress[index] = user_input
        end
        print "#{@image.print_heart}"
        # look at how to find indices for multiple occurences of a letter
      else
        # update attempts count
        @attempts -= 1
        # update image
        @image.num_attempts = @attempts
        puts "#{@image.print_heart}"
      end

      if @word_split == @word_in_progress
        puts "Congratulations, you won!"
      elsif @attempts == 0
        puts "You lost."
      end


    end
    puts @word

  end

end

# allows user to play multiple times
def play_game
  game = Game.new
  puts game.round
  play_again
end

# controls logic for multiple games
def play_again
  puts "Would you like to play again?"
  user_choice = gets.chomp.downcase

  case user_choice
  when "yes","y"
    play_game
  when "n","no"
    puts "Goodbye!"
  else
    puts "Didn't catch that."
    play_again
  end
end

play_game
