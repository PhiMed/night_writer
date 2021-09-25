require './lib/terminal'

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

  # end
end
