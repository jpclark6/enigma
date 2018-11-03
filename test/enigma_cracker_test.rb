require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class EnigmaCrackerTest < Minitest::Test
  def test_it_exists
    ec = EnigmaCracker.new
    assert_instance_of EnigmaCracker, ec
  end
  
end
