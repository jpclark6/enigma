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
end
