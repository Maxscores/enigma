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
    new_character_values = encrypt_characters(character_values, offset)
    new_character_values.join("")
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

end
