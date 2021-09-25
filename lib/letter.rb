class Letter
  attr_reader :roman_letter, :braille_letter

  def initialize(data)
    @roman_letter = data[:roman_letter]
    @braille_letter = data[:braille_letter]
  end
end
