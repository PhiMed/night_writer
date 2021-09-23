class Terminal

  attr_reader :stuff

  def initialize(stuff)
    @stuff = (stuff).to_s
    self.print_message
  end

  def print_message
    puts "Created #{@stuff} containing 256 characters"
  end
end
