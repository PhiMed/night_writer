require './lib/terminal'
require './lib/translator'
require './lib/letter'

require 'csv'

class Dictionary
  @@filename = './lib/braille_dictionary.csv'

  def initialize
    @dictionary = (
      letter_objects = []
      CSV.foreach(@@filename, headers: true, header_converters: :symbol) do |row|
        letter_objects << Letter.new(row)
      end
      letter_objects)
  end

end
