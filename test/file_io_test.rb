require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'

class FileIOTest < Minitest::Test
  def test_it_exists
    file_io = FileIO.new
    assert_instance_of FileIO, file_io
  end

  def test_it_can_write_and_read_a_file
    file_io = FileIO.new
    string = "Write this to a file!"
    file = "./data/test_file.txt"
    file_io.write(string, file)
    actual = file_io.read(file)
    assert_equal string, actual
  end
end
