require './lib/translator'

class Formatter
@@filename = "./braille.txt"
  attr_reader :unformatted_braille

  def initialize
    # @unformatted_braille = (
    #                       translator = Translator.new
    #                       translated_content = translator.translate
    #                       translated_content)
    @unformatted_braille = File.read(@@filename)
  end

  def reformat
    open('test.txt', 'a') { |f|
      f << "00\n"
      f << "..\n"
      f << "..\n"
        }
  end
end
#
#   def reformat
#     source = File.read('./test2.txt')
#     file = open("test.txt", 'a')
#     file.each do |line
#
# end
#
#   File.write("./test.txt", @unformatted_braille)
#
#     # do |file|
#       file.each_line do |line|
#         line.write @unformatted_braille
#       end
#     end
#
#      unformatted_braille.each_line(separator = $&, chomp: true) {|s| p s}
#       end
#     end
