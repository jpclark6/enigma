require './lib/rotation_finder'
require 'date'
require './lib/formatter'
require './lib/enigma_helper'
require './lib/enigma_cracker'

class Enigma
  include EnigmaHelper

  def encrypt(string, key = find_random_key, date = find_date)
    string = string.downcase
    rotations = RotationFinder.find_rotations(key, date)
    encrypted_string = cycle_string(string, rotations)
    Formatter.format_return(encrypted_string, key, date, :encryption)
  end

  def decrypt(string, numbers, date = find_date)
    string = string.downcase
    rotations = RotationFinder.find_rotations(numbers, date)
    neg_rotations = rotations.map { |rotation| (- rotation) }
    decrypted_string = cycle_string(string, neg_rotations)
    Formatter.format_return(decrypted_string, numbers, date, :decryption)
  end

  def cycle_string(string, rotations)
    new_string = ""
    string.each_char.with_index do |char, i|
      if alpha.index(char)
        num_to_add = rotations[i % rotations.count]
        new_string << alpha[(char_location(char) + num_to_add) % alpha.length]
      else
        new_string << char
      end
    end
    new_string
  end

  def char_location(char)
    alpha.index(char)
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
