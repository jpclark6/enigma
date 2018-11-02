require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation_finder'

class RotationFinderTest < Minitest::Test
  def test_it_exists
    rotations = RotationFinder.new
    assert_instance_of RotationFinder, rotations
  end
end
