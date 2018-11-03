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

end
