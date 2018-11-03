require './lib/enigma_helper'

class EnigmaCracker
  include EnigmaHelper

  def crack(encryption, date = find_date)
    modded_rotations = possible_rotations(encryption)
    modded_key = back_out_date(modded_rotations, date)
    find_real_key(modded_key)
  end

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

  def find_real_key(modded_key)
    modded_key.map! { |num| num % alpha.length }
    upper_mod_bound = 1
    4.times do
      multipliers = (0..upper_mod_bound).to_a.repeated_permutation(4)
      nums_to_add = multipliers.map do |rotations|
        mod_to_add = alpha.length
        rotations.map! { |loc| loc * mod_to_add }
      end
      nums_to_add.find do |mods|
        possible_key = combine_key_and_mods(modded_key, mods)
        return key_to_string(possible_key) if key_valid?(possible_key)
      end
      upper_mod_bound += 1
    end
  end

  def key_to_string(key_array)
    key_strings = make_key_strings(key_array)
    key = ""
    key << key_strings[0]
    key << key_strings[1][1]
    key << key_strings[3]
  end

  def combine_key_and_mods(modded_key, mods)
    modded_key.map.with_index do |modded_key_num, i|
      modded_key_num + mods[i]
    end
  end

  def key_valid?(key)
    valid = true
    key_strings = make_key_strings(key)
    (0..2).each do |i|
      if key_strings[i][1] != key_strings[i + 1][0]
        valid = false
      end
    end
    valid
  end

  def make_key_strings(key)
    key.map do |num|
      string_num = num.to_s
      if string_num.length == 1
        string_num = "0" + string_num
      end
      string_num
    end
  end

  def back_out_date(rotations, date)
    date_numbers = RotationFinder.find_date_numbers(date)
    rotations.map.with_index { |rotate, i| rotate - date_numbers[i] }
  end

end
