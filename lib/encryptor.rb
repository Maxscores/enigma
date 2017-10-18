require './lib/offset'
require './lib/key_generator'
require './lib/helper_methods'

class Encryptor < HelperMethods
  attr_reader :characters

  def initialize
    @characters = Characters.new.characters
  end

  def encrypt(message, key = KeyGenerator.new.key, date = Date.today)
    offset = Offset.new(key, date).offset
    character_values = format_message(message)
    encrypted_character_values = encrypt_characters(character_values, offset)
    encrypted_character_values.join("")
  end

  def encrypt_characters(character_values, offset)
    counter = (-1)
    character_values.map do |value|
      counter += 1
      new_value = (value + offset[counter%4]) % (characters.count-1)
      characters.key(new_value)
    end
  end

  def encrypt_file(file_to_read)
    file = File.readlines(file_to_read)
    encrypted_file = file.map do |line|
      encrypt(line.chomp)
    end
    encrypted_file.join("")
  end
end
