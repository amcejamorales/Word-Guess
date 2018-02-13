# array of words
words = ["apple", "coconut", "carrot", "skein", "metronome"]

# heart_parts.each do |heart_part|
#   loser_img += "#{heart_part}\n"
#   puts loser_img
#
# end

class Image
  attr_writer :num_attempts
  def initialize
    @num_attempts = 5
    @heart_parts = ["  ,d88b.d88b,", "  88888888888", "  `Y8888888Y'", "    `Y888Y'", "      `Y'"]

  end

  def print_heart
    loser_img = ""
    @num_attempts.times do |attempt|
      loser_img += "#{@heart_parts[attempt]}\n"
    end
    return loser_img

  end
end




class Game

  attr_accessor :word, :word_split

  def initialize(word_list)
    @attempts = 5
    @image = Image.new
    @word = word_list.sample
    @word_split = @word.split('')
    @word_in_progress = Array.new(@word.length, "_")
  end

  def play
    if @attempts != 0 && @word_split == @word_in_progress
      print "Congratulations! You won!"
      puts @word_split
    elsif @attempts == 0
      puts "You lost."
    end
  end

  def round
    # get word length
    # loop through word length and puts "_" that many times
    while @attempts > 0
      print "Guess a letter: "
      puts @word_in_progress
      puts "\n\n"
      user_letter = gets.chomp

      # updates word if user guesses letter correctly
      if @word_split.include?(user_letter)
        # does something
        user_letter_indices = @word_split.each_index.select {|i| @word_split[i] == user_letter}

        user_letter_indices.each do |index|
          @word_in_progress[index] = user_letter
        end
        puts "#{@image.print_heart}"
        puts @word_in_progress
        # look at how to find indices for multiple occurences of a letter
      else
        # update attempts count
        @attempts -= 1
        puts @attempts
        # update image
        @image.num_attempts = @attempts
        puts "#{@image.print_heart}"
      end

      play
    end


  end
end

new_word = Game.new(words)
puts new_word.word
puts "#{new_word.word_split}"
puts new_word.round


# ,d88b.d88b,
# 88888888888
# `Y8888888Y'
#   `Y888Y'
#     `Y'
