class Letter
  attr_reader :roman_letter,
              :top_row,
              :middle_row,
              :bottom_row,
              :braille_string,
              :alt_string

  def initialize(data)
    @roman_letter = data[:roman_letter]
    @top_row = data[:top_row]
    @middle_row = data[:middle_row]
    @bottom_row = data[:bottom_row]
    @braille_string = data[:braille_string]
    @alt_string = data[:alt_string]
  end
end
