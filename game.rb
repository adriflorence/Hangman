class Game

  attr_reader :player, :guessed_letters, :hiddentext

  def initialize(player, hiddentext)
    @player = player
    @guessed_letters = []
    @hiddentext = hiddentext
  end

  def guess_letter
    guessed_letter = gets.chomp[0]
    if !@hiddentext.include?(guessed_letter)
      @player.lose_life()
    end
    if !@guessed_letters.include?(guessed_letter)
      @guessed_letters << guessed_letter
    end
    return @guessed_letters
  end

  def reveal_text()
    @hiddentext.display(@guessed_letters)
  end

  def lives_remaining()
    return @player.lives
  end

  def is_lost
    return @player.lives = 0
  end

  def is_won
    return !reveal_text().include?("*")
  end

end
