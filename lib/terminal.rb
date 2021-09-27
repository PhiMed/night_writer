require './lib/dictionary'
require './lib/translator'

class Terminal

  attr_reader :user_provided_file, :output_braile_file

  def initialize(user_provided_file, output_braile_file)
    @user_provided_file = user_provided_file
    @output_braile_file = output_braile_file
    self.copy_translate_transpose_and_save
    self.print_message
  end

  def print_message
    puts "Created #{@output_braile_file} containing #{character_count(@output_braile_file)} characters"
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

  #doesn't get ride of the "[]" characters for some reason
  def translate
    translator = Translator.new(@user_provided_file)
    translated_content = translator.translate
    translated_content
  end

  def transpose
      translate.transpose
  end

  def zip_line_breaks
    a = transpose
    b = ["\n", "\n", "\n"]
    c = a.zip(b)
  end

  def save
    File.new(@output_braile_file, mode: "w")
    open(@output_braile_file, 'a'){ |f|
    zip_line_breaks.each do |character|
      f << "#{character[0]}"
      f << "#{character[1]}"
    end}
  end

  def copy_translate_transpose_and_save
    copy_file(@user_provided_file)
    translate
    save
  end
end
