require './lib/cracker'
require './lib/encryptor'
require './lib/decryptor'
require 'date'

class Enigma
  def decrypt(message, key, date = Date.today)
    decryptor = Decryptor.new
    message = decryptor.decrypt(message, key, date)
    puts "Decrypted message with key #{key} on #{date}"
    puts message
    message
  end

  def encrypt(message, key = KeyGenerator.new.key, date = Date.today)
    encryptor = Encryptor.new
    message = encryptor.encrypt(message, key, date)
    puts "Encrypted message with key #{key} on #{date}"
    puts message
    message
  end

  def crack(encryption, date = Date.today)
    cracker = Cracker.new
    message = cracker.crack(encryption, date)
    puts "Cracked message on #{date}"
    puts message
    message
  end
end
