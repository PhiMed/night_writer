class Terminal

  attr_reader :user_provided_file, :output_braile_file

  def initialize(user_provided_file, output_braile_file)
    @user_provided_file = user_provided_file
    @output_braile_file = output_braile_file
    self.print_message
  end

  def print_message
    puts "Created #{@output_braile_file} containing XXX characters"
  end

  def character_count
    file = File.open("./#{@user_provided_file}")
    results = file.read
    results.length
  end
end
