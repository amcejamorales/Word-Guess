require "colorize"

# array of words
words = ["apple", "coconut", "carrot", "skein", "metronome"]

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

  def play
    if @word_split == @word_in_progress
      puts "Congratulations! You won!"
      puts @word
    elsif @attempts == 0
      puts "You lost."
      puts @word
    end
  end

  def play_again
    puts " Would you like to play again?"
    play_again = gets.chomp

    if play_again == "yes"
      puts Game.new.round
    else
      puts "goodbye!"
    end

  end

  def round
    # get word length
    # loop through word length and puts "_" that many times
    while @attempts != 0 && @word_split != @word_in_progress
      puts "\n"
      print "Guess a letter: "
      puts @word_in_progress.join
      user_letter = gets.chomp

      # updates word if user guesses letter correctly
      if @word_split.include?(user_letter)
        # does something
        user_letter_indices = @word_split.each_index.select {|i| @word_split[i] == user_letter}

        user_letter_indices.each do |index|
          @word_in_progress[index] = user_letter
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

      play
    end
    play_again

  end

end


new_word = Game.new
# puts new_word.word
# puts "#{new_word.word_split}"

puts new_word.round



# if user answers yes run Game


#if user answers no exit


# ,d88b.d88b,
# 88888888888
# `Y8888888Y'
#   `Y888Y'
#     `Y'
