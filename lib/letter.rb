class Letter
  attr_reader :roman_letter, :top_row, :middle_row, :bottom_row

  def initialize(data)
    @roman_letter = data[:roman_letter]
    @top_row = data[:top_row]
    @middle_row = data[:middle_row]
    @bottom_row = data[:bottom_row]
  end
end
