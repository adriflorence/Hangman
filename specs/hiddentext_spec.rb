require("minitest/autorun")
require("minitest/rg")

require_relative("../hiddentext.rb")

class HiddenWordTest < MiniTest::Test

  def setup
    @text = HiddenText.new("Appa rat")
  end

  def test_is_hidden
    assert_equal("**** ***", @text.hide_text())
  end

  def test_text_includes_letter
    assert(true, @text.text_includes_letter("t"))
  end

  def test_set_up_guessed_letters_array
    reveal_letters_array = @text.set_up_guessed_letters_array()
    assert_equal(8, reveal_letters_array.length)
  end

  def test_update_array_of_guessed_letters
    array = @text.set_up_guessed_letters_array()
    revealed_t = @text.update_array_of_guessed_letters(array, "t")
    assert_equal(true, @text.return_boolean_state_for_letter(array, "t"))
    revealed_p = @text.update_array_of_guessed_letters(array, "p")
    assert_equal(true, @text.return_boolean_state_for_letter(array, "p"))
  end

  def test_reveal_letters_array
    new_array = @text.set_up_guessed_letters_array()
    revealed_t = @text.update_array_of_guessed_letters(new_array, "t")
    assert_equal("**** **t", @text.display_text_with_asterixes(revealed_t))

    revealed_p = @text.update_array_of_guessed_letters(revealed_t, "p")
    assert_equal("*pp* **t", @text.display_text_with_asterixes(revealed_p))
  end

end
