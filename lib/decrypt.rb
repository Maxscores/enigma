require "./lib/decryptor"
#ARGV = ['encrypted.txt', 'decrypted.txt', 'key', 'date_code']

decryptor = Decryptor.new()
decrypted_text = decryptor.decrypt_file(ARGV[0], ARGV[2], ARGV[3])
decryptor.write_file(ARGV[1], decrypted_text)

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
