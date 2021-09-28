require './lib/dictionary'
require './lib/translate_to_braille'
require './lib/wraparound'

class Writer

  attr_reader :user_provided_file, :output_file

  def initialize(user_provided_file, output_file)
    @user_provided_file = user_provided_file
    @output_file = output_file
    self.copy_translate_and_save_to_braille
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

  def translate_to_braille
    translator = TranslateToBraille.new(@user_provided_file)
    translated_to_braille_content = translator.translate_to_braille
    a = translated_to_braille_content.transpose
    b = ["\n", "\n", "\n"]
    c = a.zip(b)
    c
  end

  def save_to_braille
    File.new(@output_file, mode: "w")
    open(@output_file, 'a'){ |f|
    translate_to_braille.each do |line|
      f << line[0].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')
      f << "#{line[1]}"
    end}
  end

  def do_the_wraparound
    wraparound = Wraparound.new(@output_file)
    wraparound.copy_wrap_save
  end

  def copy_translate_and_save_to_braille
    copy_file(@user_provided_file)
    translate_to_braille
    save_to_braille
    do_the_wraparound
  end
end
