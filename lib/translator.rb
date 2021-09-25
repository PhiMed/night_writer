require './lib/dictionary'

class Translator
  @@filename = "./braille.txt"
  attr_reader :content

  def initialize
    @content = File.read(@@filename)
    @dictionary = Dictionary.new
  end

  def content_to_array_of_characters
    @content.scan /\w/
  end

  def translate
    original_array = content_to_array_of_characters
    translated_array = []
    original_array.each do |letter|
      @dictionary.letters.each do |letter_object|
        if letter == letter_object.roman_letter
          translated_array << letter_object.braille_letter
        end
      end
    end
    translated_array
    require "pry"; binding.pry
  end
end
