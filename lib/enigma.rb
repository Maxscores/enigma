require './lib/offset'
require './lib/characters'
require './lib/encryptor'
require './lib/decryptor'
require 'date'
require 'pry'

class Enigma
  attr_reader  :characters
  attr_accessor :random_key, :default_date

  def initialize
    @random_key = KeyGenerator.new.key
    @default_date = Date.today
    @characters = Characters.new.characters
  end

  def decrypt(message, key, date)
    decryptor = Decryptor.new
    decryptor.decrypt(message, key, date)
  end

  def encrypt(message, key = random_key, date = default_date)
    offset = Offset.new(key, date).offset
    character_values = format_message(message)
    encrypted_character_values = encrypt_characters(character_values, offset)
    encrypted_character_values.join("")
  end

  def format_message(message)
    message.split("").map {|character| characters[character]}
  end

  def encrypt_characters(character_values, offset)
    counter = (-1)
    character_values.map do |value|
      counter += 1
      new_value = (value + offset[counter%4])% characters.count
      characters.key(new_value)
    end
  end

  def write_file(file_to_write, text_to_write)
    file = File.new(file_to_write, 'w')
    file.write(text_to_write)
    file.close
  end

end
