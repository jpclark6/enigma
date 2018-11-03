class FileIO
  def write(string, file_path)
    new_file = File.open(file_path, "w")
    new_file.write(string)
    new_file.close
    "Success"
  end

  def read(file_path)
    file = File.open(file_path, "r")
    file.read
  end
end
