require './lib/letter'

require 'csv'

class Dictionary
  attr_reader :letters
  @@filename = './lib/braille_dictionary.csv'

  def initialize
    @letters = (
      letter_objects = []
      CSV.foreach(@@filename, headers: true, header_converters: :symbol) do |row|
        letter_objects << Letter.new(row)
      end
      letter_objects)
  end

end
