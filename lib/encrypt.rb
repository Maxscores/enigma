require './lib/encryptor'

encryptor = Encryptor.new
encrypted_text = encryptor.encrypt_file(ARGV[0])
encryptor.write_file(ARGV[1], encrypted_text)
puts "Encrypted file: #{ARGV[1]}"
