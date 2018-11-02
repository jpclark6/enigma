require './lib/enigma'
require './lib/file_io'

file_to_convert = ARGV[0]
file_path = ARGV[1]

file_io = FileIO.new
enigma = Enigma.new

string_to_convert = file_io.read(file_to_convert)
encryption_data = enigma.encrypt(string_to_convert)
file_io.write(encryption_data[:encryption], file_path)

puts "Created '#{file_path}' with the key #{:key} and date #{:date}"


# ARGV[0] == "red.txt"
# ARGV[1] == "blue.txt"
#
# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
