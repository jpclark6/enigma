require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/formatter'

class FormatterTest < Minitest::Test
  def test_it_can_format_text_to_correct_output
    expected =  {encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    encrypt_or_decrypt = :encryption
    encrypted = "keder ohulw"
    numbers = "02715"
    date = "040895"
    assert_equal expected, Formatter.format_return(encrypted, numbers, date, encrypt_or_decrypt)
  end

end
