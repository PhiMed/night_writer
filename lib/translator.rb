require './lib/dictionary'

class Translator
  attr_reader :content

  def initialize(user_file)
    @content = File.read(user_file)
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
    translated_array
  end
end