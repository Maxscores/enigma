require "./lib/enigma"
"""
Then, if we know the key, we can decrypt:

$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
Created 'decrypted.txt' with the key 82648 and date 030415
"""
#ARGV = ['encrypted.txt', 'decrypted.txt', 'key', 'date_code']

enigma = Enigma.new
decrypted_text = enigma.decrypt_file(ARGV[0], ARGV[2], ARGV[3])
enigma.write_file(ARGV[1], decrypted_text)

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
