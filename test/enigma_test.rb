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
    assert_equal "bddf", e.cycle_string(string, rotations)
    rotations_2 = [1, 2, 3, 4]
    assert_equal "bdfh", e.cycle_string(string, rotations_2)
  end

  def test_it_can_return_formatted_answer
    e = Enigma.new
    expected =  {encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    encrypted = "keder ohulw"
    numbers = "02715"
    date = "040895"
    assert_equal expected, e.format_return(encrypted, numbers, date, :encryption)
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

  def test_it_can_use_todays_date_to_encrypt
    e = Enigma.new
    date = e.find_date
    expected = e.encrypt("hello world", "02715", date)
    actual = e.encrypt("hello world", "02715")
    assert_equal expected, actual
  end

  def test_it_can_find_random_key
    e = Enigma.new
    zeros_at_front = 0
    50.times do
      key = e.find_random_key
      assert_equal String, key.class
      assert_equal 5, key.length
      if key[0] == "0"
        zeros_at_front += 1
      end
    end
    assert zeros_at_front > 0
  end
end
