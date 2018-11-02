require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class RotationFinderTest < Minitest::Test
  def test_it_exists
    date = "010518"
    numbers = "42314"
    rotations = RotationFinder.new({date: date, numbers: numbers})
    assert_instance_if RotationFinder, rotations
  end
end
