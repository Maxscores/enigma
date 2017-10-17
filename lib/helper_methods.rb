
class HelperMethods

  def write_file(file_to_write, text_to_write)
    file = File.new(file_to_write, 'w')
    file.write(text_to_write)
    file.close
  end

  def format_message(message)
    message.split("").map {|character| characters[character]}
  end

end
