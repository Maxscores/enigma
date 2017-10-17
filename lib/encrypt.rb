require './lib/enigma'
require './lib/key_generator'
"""
In addition to the pry form above, we’ll want to use the tool from the command line like so:
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 030415
That will take the plaintext file message.txt and create an encrypted file encrypted.txt.
"""
#ARGV = ['message.txt', 'encrypted.txt']
enigma = Enigma.new
encrypted_text = enigma.encrypt_file(ARGV[0])
enigma.write_file(ARGV[1], encrypted_text)
key = enigma.random_key
date = Offset.new(12345).date_code(Date.today)
puts "Created #{ARGV[1]} with the key #{key} and date #{date}"


#do we need to write a test?
