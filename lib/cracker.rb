require './lib/offset.rb'
require 'pry'
require './lib/characters'
require './lib/decryptor'

class Cracker < Decryptor
  attr_reader :characters

  def initialize
    @characters = Characters.new.characters
  end

  def crack(encryption, date = Date.today)
    crack_offset = (encryption.length%4) * (-1)
    encrypted_end_values = encrypted_end_values(encryption, crack_offset)
    known_end_values = known_end_values(crack_offset)
    total_offset = offset_finder(encrypted_end_values, known_end_values)
    decrypted_character_values = crack_decrypt(encryption, total_offset)
    decrypted_character_values.join("")
  end

  def crack_decrypt(encryption, offset)
    character_values = format_message(encryption)
    decrypt_characters(character_values, offset)
  end

  def encrypted_end_values(encryption, crack_offset)
    encrypted_match = encryption[(crack_offset - 4)..(crack_offset - 1)]
    encrypted_match.split("").map {|character| characters[character].to_i}
  end

  def known_end_values(crack_offset)
    known_end = [".",".","e","n","d",".","."]
    matched_end = known_end[(crack_offset-4)..(crack_offset-1)]
    matched_end.map {|character| characters[character].to_i}
  end

  def offset_finder(encrypted_end_values, known_end_values)
    values_zipped = encrypted_end_values.zip(known_end_values)
    values_zipped.map do |matched|
      (matched[0] - matched[1]) % (characters.count-1)
    end
  end
end
