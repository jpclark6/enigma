require './lib/enigma_cracker'
require './lib/file_io'

file_to_crack = ARGV[0]
cracked_file = ARGV[1]
date = ARGV[2]

file_io = FileIO.new
enigma_cracker = EnigmaCracker.new

string_to_crack = file_io.read(file_to_crack).chomp
encryption_data = enigma_cracker.crack(string_to_crack, date)
file_io.write(encryption_data[:decryption], cracked_file)
