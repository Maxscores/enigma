require './lib/offset.rb'
require 'pry'
require './lib/characters'

class Cracker
  attr_reader :characters

  def initialize
    @characters = Characters.new.characters
  end

  def crack(encryption, date = Date.today)
    date_offset = Offset.new().date_offset
    crack_offset = encryption.length%4
    match_characters = encryption[(-1)*(crack_offset + 4)..(-1)*(crack_offset + 1)]
    known_characters = [".",".","e","n","d",".","."][(-1)*(crack_offset+4)..(-1)*(crack_offset+1)]
    match_values = match_characters.split("").map {|character| characters[character]}
    known_values = known_characters.map {|character| characters[character]}
    key_breaker = match_values.zip(known_values, date_offset)
    key_offset = key_breaker.map do |matched|
      result = (matched[0] - matched[1] - matched[2])%39
    end
    key = key_offset[0].to_s + key_offset[2].to_s + (key_offset[3]%10).to_s
  end



end
