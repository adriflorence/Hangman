require_relative("game.rb")
require_relative("player.rb")
require_relative("hiddentext.rb")

class Runner

  def initialize
    @player = Player.new("Adri")
    hidden_text = generate_hidden_text()
    @hidden_text = HiddenText.new(hidden_text)
    @game = Game.new(@player, @hidden_text)
    play_game()
  end

  def play_game
    until @game.is_won || @game.is_lost
      puts "Welcome to Snowman!"
      puts "The hidden text is: #{@game.reveal_text()}"
      puts "You have #{@game.lives_remaining} lives remaining"
      puts "Guess a letter:"
      @game.guess_letter()
      print %x{clear}
    end
    puts "You win!" if @game.is_won
    puts "You lose! The word was #{hidden_text}!" if @game.is_lost
  end

  def generate_hidden_text()
    text_file = []
    File.open("text_list.txt", "r").each do |file|
      file.each_line do |line|
        text_file.push(*line.split)
      end
    end
    hidden_word = text_file.sample()
    return hidden_word
  end

end

Runner.new()
