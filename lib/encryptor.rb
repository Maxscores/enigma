require './lib/offset'
require './lib/key_generator'
require './lib/helper_methods'
require './lib/characters'

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
      new_value = (value + offset[counter%4]) % (characters.count-2)
      characters.key(new_value)
    end
  end

  def encrypt_file(file_to_read)
    file = File.readlines(file_to_read)
    key = KeyGenerator.new.key
    input_file = file.map {|line| line.chomp}
    encrypted_file = encrypt(input_file.join(""), key)
    encrypted_file.gsub("~", "\n")
  end
end
