require './lib/enigma'
require './lib/file_io'

file_to_decrypt = ARGV[0]
file_path_for_text = ARGV[1]
key = ARGV[2]
date = ARGV[3]

#
# file_io = FileIO.new
# enigma = Enigma.new
#
# string_to_convert = file_io.read(file_to_convert).chomp
# encryption_data = enigma.encrypt(string_to_convert)
# file_io.write(encryption_data[:encryption], file_path)
#
# puts "Created '#{file_path}' with the key #{encryption_data[:key]} and date #{encryption_data[:date]}"
#
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
