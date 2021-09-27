require './lib/dictionary'

class TranslateToEnglish
  attr_reader :content

  def initialize(user_file)
    @content = File.read(user_file)
    @dictionary = Dictionary.new
  end

  def array_of_untranslated_characters
    total_length = @content.length
    array = @content.scan /\w/
    zip1 = []
    zip2 = []
    zip3 = []
    zip4 = []
    array.each_with_index do |character, index|
      if index < (total_length / 3)-1
        zip1 << character
      elsif
        index < ((total_length / 3)*2)-2
        zip2 << character
      elsif
        index < total_length-3
        zip3 << character
      end
    end
    first_two_zips = zip1.zip(zip2)
    last_two_zips = zip3.zip(zip4)
    big_zip = first_two_zips.zip(last_two_zips)
    aaa123 = big_zip.compact.flatten.compact
    aaa123.each_slice(6).to_a
  end

  def translate_to_english
    array = array_of_untranslated_characters
    translated_to_english_array = []
    array.each do |letter_group|
       @dictionary.letters.each do |letter_object|
         if letter_group.to_s.gsub('"','').gsub(',','').gsub('[','').gsub(']','').gsub(' ', '') == letter_object.alt_string
           translated_to_english_array << letter_object.roman_letter
         end
       end
     end
    translated_to_english_array
  end
end



# container1 = []
# container2 = []
# container3 = []
# container4 = []
# container5 = []
# container6 = []
# aaa123.each_with_index do |character, index|
#   if index == 0
#     container1 << character
#   elsif
#     index == 1
#     container3 << character
#   elsif
#     index == 2
#     container5 << character
#   elsif
#     index == 3
#     container2 << character
#   elsif
#     index == 4
#     container4 << character
#   elsif
#     index == 5
#     container6 << character
#   end
# end
# require "pry"; binding.pry
