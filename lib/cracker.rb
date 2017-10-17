require './lib/offset.rb'
require 'pry'
require './lib/characters'
require './lib/decryptor'

class Cracker < Decryptor
  attr_reader :characters

  def initialize
    @characters = Characters.new.characters
  end

  def crack(encryption, date = Date.today, key = nil)
    date_offset = Offset.new(key, date).date_offset
    crack_offset = (encryption.length%4) * (-1)
    encrypted_end_values = encrypted_end_values(encryption, crack_offset)
    known_end_values = known_end_values(crack_offset)
    values_zipped = encrypted_end_values.zip(known_end_values, date_offset)
    key = key_finder(values_zipped)
    decrypt(encryption, key, date)
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

  def key_finder(values_zipped)
    key_offset = values_zipped.map do |matched|
      (matched[0] - matched[1] - matched[2])%39
    end
    key_offset[0].to_s + key_offset[2].to_s + (key_offset[3]%10).to_s
  end


end
