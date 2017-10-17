require './lib/offset.rb'
require 'pry'
require './lib/characters'

class Cracker
  attr_reader :characters

  def initialize
    @characters = Characters.new.characters
  end

  def crack(encryption, date = Date.today, key = nil)
    date_offset = Offset.new(key, date).date_offset
    crack_offset = (encryption.length%4) * (-1)
    match_values = encrypted_end_values(encryption, crack_offset)
    known_values = known_end_values(crack_offset)
    key_breaker = match_values.zip(known_values, date_offset)
    key = key_finder(key_breaker)
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

  def key_finder(key_breaker)
    key_offset = key_breaker.map do |matched|
      result = (matched[0] - matched[1] - matched[2])%39
    end
    key = key_offset[0].to_s + key_offset[2].to_s + (key_offset[3]%10).to_s
  end


end
