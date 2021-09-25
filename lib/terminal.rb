class Terminal

  attr_reader :user_provided_file, :output_braile_file

  def initialize(user_provided_file, output_braile_file)
    @user_provided_file = user_provided_file
    @output_braile_file = output_braile_file
    self.print_message
  end

  def print_message
    puts "Created #{@output_braile_file} containing #{character_count(@user_provided_file)} characters"
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

  def copy_users_file
    file = File.open(@user_provided_file)
    results = file.read
    file.close
    results
  end

  def create_new_file
    File.new(@output_braile_file, mode: "w")
  end

  def copy_into_new_file
    content = copy_users_file
    file = File.open(@output_braile_file, mode: "w")
    file.write(content)
    file.close
  end

  def copy_and_create
    copy_users_file
    create_new_file
    copy_into_new_file
  end
end
