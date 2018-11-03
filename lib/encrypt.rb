require './lib/enigma'
require './lib/file_io'

file_to_convert = ARGV[0]
encryption_file_path = ARGV[1]

file_io = FileIO.new
enigma = Enigma.new

string_to_convert = file_io.read(file_to_convert).chomp
encryption_data = enigma.encrypt(string_to_convert)
file_io.write(encryption_data[:encryption], encryption_file_path)

puts "Created '#{encryption_file_path}' with the key #{encryption_data[:key]}\
 and date #{encryption_data[:date]}"
