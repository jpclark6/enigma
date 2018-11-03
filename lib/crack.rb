require './lib/enigma'
require './lib/file_io'

file_to_crack = ARGV[0]
cracked_file = ARGV[1]
date = ARGV[2]

file_io = FileIO.new
e = Enigma.new

string_to_crack = file_io.read(file_to_crack).chomp
decryption_data = e.crack(string_to_crack, date)
file_io.write(decryption_data[:decryption], cracked_file)

puts "Created '#{cracked_file}' with the cracked key #{decryption_data[:key]} and date #{decryption_data[:date]}"
