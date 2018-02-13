# array of words
words = ["apple", "coconut", "carrot", "skein", "metronome"]

class Word

  attr_accessor :word, :word_split

  def initialize(word_list)
    @attempts = 5
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
      user_letter = gets.chomp

      # updates word if user guesses letter correctly
      if @word_split.include?(user_letter)
        # does something
        user_letter_index = @word_split.index(user_letter)

        @word_in_progress[user_letter_index] = user_letter
        puts @word_in_progress
        # look at how to find indices for multiple occurences of a letter
      else
        # update attempts count
        @attempts -= 1
        puts @attempts
        # update image
      end
      play
    end


    end



end

new_word = Word.new(words)
puts new_word.word
puts "#{new_word.word_split}"
puts new_word.round