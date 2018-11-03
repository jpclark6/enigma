require './lib/enigma_cracker'
require './lib/file_io'

# file_to_convert = ARGV[0]
# file_path = ARGV[1]
#
# file_io = FileIO.new
# enigma = Enigma.new
#
# string_to_convert = file_io.read(file_to_convert).chomp
# encryption_data = enigma.encrypt(string_to_convert)
# file_io.write(encryption_data[:encryption], file_path)


$ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
Created 'cracked.txt' with the cracked key 82648 and date 240818
