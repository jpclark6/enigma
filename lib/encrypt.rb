require './lib/enigma'
require './file_io'

file_to_convert = ARGV[0]
file_path = ARGV[1]

file_io = FileIO.new

string_to_convert = file_io.read(file_to_convert)

enigma = Enigma.new

converted_string = enigma.encrypt(string_to_convert)

# ARGV[0] == "red.txt"
# ARGV[1] == "blue.txt"
#
# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
