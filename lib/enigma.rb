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
    encryptor = Encryptor.new
    encryptor.encrypt(message, key, date)
  end

  def crack(encryption, date = default_date)
    cracker = Cracker.new
    cracker.crack(encryption, date)
  end
end
