require './lib/writer'

class Wraparound
  attr_reader  :content, :file

  def initialize(file)
    @file = file
    @content = File.read(file)
  end

  def chomp_first_eighty
    message_in_thirds = @content.split
    a = []
    b = []
    c = []
    d = []
    e = []
    f = []
    all = []
    message_in_thirds.each_with_index do |one_third, i|
      a << one_third.slice(0, 80)
      b << one_third.slice(80, 80)
      c << one_third.slice(160, 80)
      d << one_third.slice(240, 80)
      e << one_third.slice(320, 80)
      f << one_third.slice(400, 80)
    end
    all << a
    all << b
    all << c
    all << d
    all << e
    all << f
    all
  end

  def write_to_file
    File.open(@file, 'w') {}
    lines = File.readlines(@file)
    lines[1] = '' << "#{chomp_first_eighty[0][0].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[2] = '' << "#{chomp_first_eighty[0][1].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[3] = '' << "#{chomp_first_eighty[0][2].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[4] = '' << "\n"
    lines[5] = '' << "#{chomp_first_eighty[1][0].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[6] = '' << "#{chomp_first_eighty[1][1].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[7] = '' << "#{chomp_first_eighty[1][2].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[8] = '' << "\n"
    lines[9] = '' << "#{chomp_first_eighty[2][0].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[10] = '' << "#{chomp_first_eighty[2][1].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[11] = '' << "#{chomp_first_eighty[2][2].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[12] = '' << "\n"
    lines[13] = '' << "#{chomp_first_eighty[3][0].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[14] = '' << "#{chomp_first_eighty[3][1].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    lines[15] = '' << "#{chomp_first_eighty[3][2].to_s.gsub('"', '').gsub(',','').gsub('[', '').gsub(']','').gsub(' ', '')}\n"
    File.open(@file, 'w') { |f| f.write(lines.join) }
  end

  def copy_wrap_save
    chomp_first_eighty
    write_to_file
  end
end
