require './lib/encryptor'
require './lib/key_generator'


#ARGV = ['message.txt', 'encrypted.txt']
encryptor = Encryptor.new
encrypted_text = encryptor.encrypt_file(ARGV[0])
encryptor.write_file(ARGV[1], encrypted_text)
puts "Encrypted file: #{ARGV[1]}"


#do we need to write a test?
