require './lib/rotation_finder'
require 'date'
require './lib/formatter'
require './lib/enigma_helper'
require './lib/enigma_cracker'

class Enigma
  include EnigmaHelper

  def encrypt(string, numbers = find_random_key, date = find_date)
    rotations = RotationFinder.find_rotations(numbers, date)
    encrypted_string = cycle_string(string, rotations)
    Formatter.format_return(encrypted_string, numbers, date, :encryption)
  end

  def decrypt(string, numbers, date = find_date)
    rotations = RotationFinder.find_rotations(numbers, date)
    neg_rotations = rotations.map { |rotation| (- rotation) }
    decrypted_string = cycle_string(string, neg_rotations)
    Formatter.format_return(decrypted_string, numbers, date, :decryption)
  end

  def cycle_string(string, rotations)
    encrypted_string = ""
    string.each_char.with_index do |char, i|
      char_location = alpha.index(char)
      num_to_add = rotations[i % rotations.count]
      letter = alpha[(char_location + num_to_add) % alpha.length]
      encrypted_string << letter
    end
    encrypted_string
  end

  def find_random_key
    key = ""
    5.times { key << rand(10).to_s }
    key
  end

  def crack(encryption, date)
    ec = EnigmaCracker.new
    real_key = ec.crack(encryption, date)
    decrypt(encryption, real_key, date)
  end
end
