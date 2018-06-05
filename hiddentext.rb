class HiddenText

  def initialize(hidden_text)
    @hidden_text = hidden_text
  end

  def display(guesses = [])
    displayed_word = ""
    for char in @hidden_text.split('')
      if guesses.include?(char) || char == " "
        displayed_word << char
      else
        displayed_word << "*"
      end
    end
    return displayed_word
  end

  def include?(letter)
    return @hidden_text.include?(letter)
  end

end
