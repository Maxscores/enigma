require './lib/cracker'
require './lib/encryptor'
require './lib/decryptor'
require 'date'

class Enigma
  def decrypt(message, key, date = Date.today)
    decryptor = Decryptor.new
    decryptor.decrypt(message, key, date)
  end

  def encrypt(message, key = KeyGenerator.new.key, date = Date.today)
    encryptor = Encryptor.new
    encryptor.encrypt(message, key, date)
  end

  def crack(encryption, date = Date.today)
    cracker = Cracker.new
    cracker.crack(encryption, date)
  end
end
