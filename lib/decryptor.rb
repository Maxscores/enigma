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
    counter = (-1)
    character_values.map do |value|
      counter += 1
      new_value = (value - offset[counter%4])% characters.count
      characters.key(new_value)
    end
  end

  def decrypt_file(file_to_read, key, date_code)
    file = File.readlines(file_to_read)
    decrypted_file = file.map do |line|
      decrypt(line.chomp, key, date_code)
    end
    decrypted_file.join("")
  end

end
