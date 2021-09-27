require './lib/dictionary'
require './lib/translate_to_english'

class Reader

  attr_reader :user_provided_file, :output_file

  def initialize(user_provided_file, output_file)
    @user_provided_file = user_provided_file
    @output_file = output_file
    self.copy_translate_transpose_and_save_to_english
    self.print_message
  end

  def print_message
    puts "Created #{@output_file} containing #{character_count(@output_file)} characters"
  end

  def character_count(file)
    if File.exists?(file) == true
      file = File.open(file)
      results = file.read
      results.length
    else
      0
    end
  end

  def copy_file(file)
    file = File.open(file)
    results = file.read
    file.close
    results
  end

  def translate_to_english
    translator = TranslateToEnglish.new(@user_provided_file)
    translator.translate_to_english
  end

  def save_to_english
    File.new(@output_file, mode: "w")
    open(@output_file, 'a'){ |f|
    translate_to_english.each do |character|
      f << character[0].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')
      f << "#{character[1]}"
    end}
  end

  def copy_translate_transpose_and_save_to_english
    copy_file(@user_provided_file)
    translate_to_english
    save_to_english
  end
end
