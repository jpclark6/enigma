require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation_finder'

class RotationFinderTest < Minitest::Test
  def test_it_exists
    rotations = RotationFinder.new
    assert_instance_of RotationFinder, rotations
  end

  def test_it_can_find_number_pairs
    numbers = "24678"
    number_pairs = [24, 46, 67, 78]
    assert_equal number_pairs, RotationFinder.find_number_pairs(numbers)
  end

  def test_it_can_find_date_additions
    date = "040895"
    date_numbers = [1, 0, 2, 5]
    assert_equal date_numbers, RotationFinder.find_date_numbers(date)
  end

  def test_it_can_find_total_rotations
    numbers = "24678"
    date = "040895"
    final_numbers = [25, 46, 69, 83]
    assert_equal final_numbers, RotationFinder.find_rotations(numbers, date)
  end

  def test_it_can_decrypt_messages
    e = Enigma.new
    actual = e.decrypt("keder ohulw", "02715", "040895")
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, actual
  end
end
