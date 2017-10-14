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
    character_values = message.split("").map do |character|
      characters[character]
    end
    counter = -1
    new_character_values = character_values.map do |value|
      # binding.pry
      counter += 1
      (value + offset[counter%4])% characters.count
    end

  end



end
