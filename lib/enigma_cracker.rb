require './lib/enigma'
require './lib/enigma_helper'

class EnigmaCracker
  include EnigmaHelper

  def initialize
    @e = Enigma.new
  end

  def crack(encryption, date = find_date)
    all_key_combos.each_with_index do |key, i|
      data = @e.decrypt(encryption, key.join, date)
      return data if data[:decryption][-4..-1] == " end"
    end
  end

  def all_key_combos
    ("0".."9").to_a.repeated_permutation(5)
  end

  def possible_rotations(encryption)
    last_chars = " end"
    rotations = []
    last_chars.each_char.with_index do |char, i|
      rotations <<  alpha.index(char) - alpha.index(encryption[-4 + i])
    end
    rotate_back =  (encryption.length % 4)
    binding.pry
    rotations.rotate!(rotate_back)
  end

end
