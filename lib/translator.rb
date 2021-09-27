require './lib/dictionary'

class Translator
  @@filename = "./message.txt"
  attr_reader :content

  def initialize
    @content = File.read(@@filename)
    @dictionary = Dictionary.new
  end

  def array_of_untranslated_characters
    @content.scan /\w/
  end

  def translate
    original_array = array_of_untranslated_characters
    translated_array = []
    original_array.each do |letter|
      @dictionary.letters.each do |letter_object|
        if letter == letter_object.roman_letter
          translated_array << [letter_object.top_row, letter_object.middle_row, letter_object.bottom_row]
        end
      end
    end
    translated_array.transpose
  end
end
