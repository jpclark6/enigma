require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_cracker'

class EnigmaCrackerTest < Minitest::Test
  def test_it_exists
    ec = EnigmaCracker.new
    assert_instance_of EnigmaCracker, ec
  end

  def test_it_can_crack_code
    ec = EnigmaCracker.new
    date = "021118"
    expected_message = "see if you can crack this one end"
    expected_key = "00241"
    encryption = "apdrrqzpxezujyzu lbbidg aknenkdem"
    actual = ec.crack(encryption, date)
    assert_equal expected_message, actual[:decryption]
    assert_equal expected_key, actual[:key]
  end

  def test_it_can_find_possible_rotations
    ec = EnigmaCracker.new
    # date = "031118"
    # actual_key = "62513"
    # date_numbers = [9, 9, 2, 4]
    # key_numbers = [62, 25, 51, 13]
    encryption = "jlrjigddu"
    rotations = [71, 34, 53, 17]
    expected = rotations.map { |rotate| rotate % ec.alpha.length }
    assert_equal expected, ec.possible_rotations(encryption)
  end

  def test_it_can_back_out_date
    ec = EnigmaCracker.new
    date = "031118"
    rotations = [71, 34, 53, 17]
    # date_numbers = [9, 9, 2, 4]
    expected = [62, 25, 51, 13]
    assert_equal expected, ec.back_out_date(rotations, date)
  end

  def test_if_it_can_tell_if_key_is_valid_from_4_nums
    ec = EnigmaCracker.new
    # valid_key = "02410"
    valid = [2, 24, 41, 10]
    invalid = [13, 41, 31, 4]
    assert_equal true, ec.key_valid?(valid)
    assert_equal true, ec.key_valid?(invalid)
  end

end
