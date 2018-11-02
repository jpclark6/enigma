require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_it_has_alpha_and_space
    e = Enigma.new
    assert_instance_of Array, e.alpha
    assert_equal "a", e.alpha.first
    assert_equal " ", e.alpha[26]
  end

  def test_it_can_encrypt_string
    e = Enigma.new
    result = e.encrypt("hello world", "02715", "040895")
    expected =  {encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    assert_equal expected, result
  end

  def test_it_can_find_date_string_from_date_class
    expected = Date.today.strftime("%d%m%y")
    e = Enigma.new
    assert_equal expected, e.find_date
    assert_equal 6, e.find_date.length
  end

  def test_it_can_cycle_strings
    e = Enigma.new
    string = "abcd"
    rotations = [1, 2]
    assert_equal "bcdf", e.cycle_string(string, rotations)
    rotations_2 = [1, 2, 3, 4]
    assert_equal "bdfh", e.cycle_string(string, rotations_2)
  end
end
