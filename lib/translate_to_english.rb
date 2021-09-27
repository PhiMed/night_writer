require './lib/dictionary'

class TranslateToEnglish
  attr_reader :content

  def initialize(user_file)
    @content = File.read(user_file)
    @dictionary = Dictionary.new
  end

  def array_of_untranslated_characters
    array = @content.delete("\n").split('')
    total_length = array.length
    one_third = total_length / 3
    sliced = array.each_slice(one_third).to_a
    zip1 = sliced[0]
    zip2 = sliced[1]
    zip3 = sliced[2]
    zip4 = []
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
    translated_to_english_array.to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','')
  end
end
