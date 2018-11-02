require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'

class FileIOTest < Minitest::Test
  def test_it_exists
    file_io = FileIO.new
    assert_instance_of FileIO, file_io
  end
end
