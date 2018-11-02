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
    rotations = RotationFinder.new
    assert_equal number_pairs, rotations.find_number_pairs(numbers)
  end
end
