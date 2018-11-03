require './lib/enigma'
require './lib/file_io'

file_to_decrypt = ARGV[0]
file_path_for_text = ARGV[1]
key = ARGV[2]
date = ARGV[3]

file_io = FileIO.new
enigma = Enigma.new

string_to_decrypt = file_io.read(file_to_decrypt).chomp
decryption_data = enigma.decrypt(string_to_decrypt, key, date)
file_io.write(decryption_data[:decryption], file_path_for_text)

puts "Created '#{file_path_for_text}' with the key #{decryption_data[:key]} and date #{decryption_data[:date]}"
