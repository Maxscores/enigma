require './lib/offset'
require './lib/characters'
require './lib/helper_methods'

class Decryptor < HelperMethods
  attr_reader :characters

  def initialize
    @characters = Characters.new.characters
  end

  def decrypt(message, key, date = Date.today)
    offset = Offset.new(key, date).offset
    character_values = format_message(message)
    decrypted_character_values = decrypt_characters(character_values, offset)
    decrypted_character_values.join("")
  end

  def decrypt_characters(character_values, offset)
    character_values.map.with_index do |value, index|
      new_value = (value - offset[index%4]) % (characters.count-2)
      characters.key(new_value)
    end
  end

  def decrypt_file(file_to_read, key, date_code)
    file = File.readlines(file_to_read)
    encrypted_file = file.map {|line| line.chomp}
    decrypted_file = decrypt(encrypted_file.join("~"), key, date_code)
    decrypted_file.gsub("~", "\n")
  end
end
