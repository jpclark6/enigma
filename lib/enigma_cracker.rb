require './lib/enigma_helper'

class EnigmaCracker
  include EnigmaHelper

  def crack(encryption, date = find_date)
    rotations_after_module = possible_rotations(encryption)
    possible_key = back_out_date(rotations_after_module, date)
    find_real_key(possible_key)
  end

  def possible_rotations(encryption)
    rotations = " end".chars.map.with_index do |char, i|
      rotate = - (alpha.index(char) - alpha.index(encryption[-4 + i]))
      rotate = rotate + alpha.length if rotate < 0
      rotate
    end
    fix_rotations_order(rotations, encryption)
  end

  def fix_rotations_order(rotations, encryption)
    rotate_back = -(encryption.length % 4)
    rotations.rotate(rotate_back)
  end

  def find_real_key(possible_key)
    nums_to_add_to_possible_key.find do |mods|
      working_key = combine_key_and_mods(possible_key, mods)
      return key_to_string(working_key) if key_valid?(working_key)
    end
    upper_mod_bound += 1
  end

  def nums_to_add_to_possible_key
    multipliers = (0..3).to_a.repeated_permutation(4)
    multipliers.map do |factors_of_alpha_length_to_add|
      mod_to_add = alpha.length
      factors_of_alpha_length_to_add.map { |loc| loc * mod_to_add }
    end
  end

  def key_to_string(key_array)
    key_strings = make_key_string_pairs(key_array)
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
    key_strings = make_key_string_pairs(key)
    (0..2).each do |i|
      valid = false if key_strings[i][1] != key_strings[i + 1][0]
    end
    valid
  end

  def make_key_string_pairs(key)
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
