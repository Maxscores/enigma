require './lib/cracker'

cracker = Cracker.new
cracked_text = cracker.crack_file(ARGV[0])
cracker.write_file(ARGV[1], cracked_text)

puts "Cracked file: #{ARGV[1]}"
