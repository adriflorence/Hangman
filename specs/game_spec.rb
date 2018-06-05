require("minitest/autorun")
require("minitest/rg")

require_relative("../game.rb")


class GameTest < MiniTest::Test

  def setup
    @word = Word.new("Apparat")
  end

end
