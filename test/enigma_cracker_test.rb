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
    encryption = "jlrjigddu"
    # date = "031118"
    # actual_key = "62513"
    # date_numbers = [9, 9, 2, 4]
    # key_numbers = [62, 25, 51, 13]
    rotations = [71, 34, 53, 17]
    expected = rotations.map { |rotate| rotate % ec.alpha.length }
    assert_equal expected, ec.possible_rotations(encryption)
  end

end
