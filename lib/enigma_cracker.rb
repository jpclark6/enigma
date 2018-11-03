require './lib/enigma'
require './lib/enigma_helper'

class EnigmaCracker
  include EnigmaHelper

  def crack(encryption, date = find_date)
    e = Enigma.new
    all_key_combos.each_with_index do |key, i|
      data = e.decrypt(encryption, key.join, date)
      return data if data[:decryption][-4..-1] == " end"
    end
  end

  def all_key_combos
    ("0".."9").to_a.repeated_permutation(5)
  end


  def super_crack(encryption)
    e = Enigma.new
    last_chars = " end"
    rotations = []
    # make sure letters align with 4 digits of decryption
    last_chars.each_char.with_index do |char, i|
      rotations <<  alpha.index(char) - alpha.index(encryption[-4 + i])
    end
    e.cycle_string(encryption, rotations)
  end

end
