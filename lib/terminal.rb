require './lib/dictionary'
require './lib/translator'
require './lib/formatter'

class Terminal

  attr_reader :user_provided_file, :output_braile_file

  def initialize(user_provided_file, output_braile_file)
    @user_provided_file = user_provided_file
    @output_braile_file = output_braile_file
    self.copy_translate_format_and_save
    self.elaborate_way_to_remove_brackets
    # self.reformat_braille_text
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
    translator = Translator.new
    translated_content = translator.translate
    translated_content
  end

  def reformat_braille_text
    formatter = Formatter.new
    formatter.reformat
  end

  # def save
  #   content = self.translate
  # File.new(@output_braile_file, mode: "w")
  # open(@output_braile_file, 'a'){ |f|
  #   translate.each do |character|
  #   f << "#{character[0]}\n"
  #   f << "#{character[1]}\n"
  #   f << "#{character[2]}\n"
  #   end
  #     }
  #
  # end


  def save
    translated_content = self.translate
    File.new(@output_braile_file, mode: "w")
    file = File.open(@output_braile_file, mode: "w")
    file.write(translated_content.to_s.gsub('"', '').gsub(' ', '').gsub(',', ''))
    file.close
  end

  #need to figure out how to get rid of '[]' some other way
  def elaborate_way_to_remove_brackets
    content = copy_file(@output_braile_file)
    file = File.open(@output_braile_file, mode: "w")
    file.write(content.to_s.gsub('[', '').gsub(']', ''))
    file.close
  end

  def copy_translate_format_and_save
    copy_file(@user_provided_file)
    translate
    # reformat_braille_text
    save
  end



end
