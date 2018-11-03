require './lib/enigma'
require './lib/enigma_helper'

class EnigmaCracker
  include EnigmaHelper

  def initialize
    @e = Enigma.new
  end

  def crack(encryption, date = find_date)
    modded_rotations = possible_rotations(encryption)
    modded_key = back_out_date(modded_rotations, date)
    real_key = find_real_key(modded_key)
    decrypt(encryption, real_key, date)
  end

  def find_real_key(modded_key)
    modded_key.map! { |num| num % alpha.length }
    multipliers = (0..4).to_a.repeated_permutation(4)
    nums_to_add = multipliers.map do |a, b, c, d|
      mod_to_add = alpha.length
      [a * mod_to_add, b * mod_to_add, c * mod_to_add, d * mod_to_add]
    end
    nums_to_add.find do |mod_a, mod_b, mod_c, mod_d|
      a = make_pair(modded_key[0], mod_a)
      b = make_pair(modded_key[1], mod_b)
      c = make_pair(modded_key[2], mod_c)
      d = make_pair(modded_key[3], mod_d)
      return combined_key(a, b, c, d) if key_valid?([a, b, c, d])
    end
    "Cannot find key"
  end

  def key_valid?(a, b, c, d)

  end

  # def crack(encryption, date = find_date)
  #   all_key_combos.each_with_index do |key, i|
  #     data = @e.decrypt(encryption, key.join, date)
  #     return data if data[:decryption][-4..-1] == " end"
  #   end
  # end
  #
  # def all_key_combos
  #   ("0".."9").to_a.repeated_permutation(5)
  # end

  def possible_rotations(encryption)
    last_chars = " end"
    rotations = []
    last_chars.each_char.with_index do |char, i|
      rotate = - (alpha.index(char) - alpha.index(encryption[-4 + i]))
      rotate = rotate + alpha.length if rotate < 0
      rotations <<  rotate
    end
    rotate_back =  - (encryption.length % 4)
    rotations.rotate!(rotate_back)
  end

  def back_out_date(rotations, date)
    date_numbers = RotationFinder.find_date_numbers(date)
    rotations.map.with_index { |rotate, i| rotate - date_numbers[i] }
  end

end
