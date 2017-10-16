require './lib/offset'
require './lib/characters'
require './lib/encryptor'
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

  def encrypt(message, key = random_key, date = default_date)
    encrypt = Encryptor.new.encrypt(message, key, date)


  end
  # def encrypt(message, key = random_key, date = default_date)
  #   offset = Offset.new(key, date).offset
  #   character_values = format_message(message)
  #   encrypted_character_values = encrypt_characters(character_values, offset)
  #   encrypted_character_values.join("")
  # end
  #
  # def format_message(message)
  #   message.split("").map {|character| characters[character]}
  # end
  #
  # def encrypt_characters(character_values, offset)
  #   counter = (-1)
  #   character_values.map do |value|
  #     counter += 1
  #     new_value = (value + offset[counter%4])% characters.count
  #     characters.key(new_value)
  #   end
  # end



  # def encrypt_file(file_to_read)
  #   file = File.readlines(file_to_read)
  #   encrypted_file = file.map do |line|
  #     encrypt(line.chomp)
  #   end
  #   encrypted_file.join("")
  # end

  # def decrypt_file(file_to_read, key, date_code)
  #   file = File.readlines(file_to_read)
  #   decrypted_file = file.map do |line|
  #     decrypt(line.chomp, key, date_code)
  #   end
  #   decrypted_file.join("")
  # end

  def write_file(file_to_write, text_to_write)
    file = File.new(file_to_write, 'w')
    file.write(text_to_write)
    file.close
  end

end
