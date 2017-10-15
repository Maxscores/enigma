require './lib/offset'
require './lib/characters'
require 'date'
require 'pry'

class Enigma
  attr_reader :random_key, :default_date, :characters

  def initialize
    @random_key = KeyGenerator.new.key
    @default_date = Date.today
    @characters = Characters.new.characters
  end

  def encrypt(message, key = random_key, date = default_date)
    offset = Offset.new(key, date).offset
    character_values = format_message(message)
    encrypted_character_values = encrypt_characters(character_values, offset)
    encrypted_character_values.join("")
  end

  def format_message(message)
    message.split("").map do |character|
      characters[character]
    end
  end

  def encrypt_characters(character_values, offset)
    counter = (-1)
    character_values.map do |value|
      counter += 1
      new_value = (value + offset[counter%4])% characters.count
      characters.key(new_value)
    end
  end

  def decrypt(message, key, date = default_date)
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

  # def encrypt_file(file_to_read)
  #   file = File.readlines(file_to_read)
  #   file.map do |line|
  #     encrypt(line)
  #   end
  # end
  #
  # def decrypt_file(file_to_read, key, date_code)
  #   file = File.readlines(file_to_read)
  #   file.map do |line|
  #     decrypt(line, key, date_code)
  #   end
  # end
  #
  # def write_file(file_to_write, text_to_write)
  #   file = File.new(file_to_write, 'w+')
  #   file.write(text_to_write)
  # end

end
