class FileIO
  def write(string, file)
    new_file = File.open(file, "w")
    new_file.write(string)
    new_file.close
    "Success"
  end

  def read(file)
    file = File.open(file, "r")
    file.read
  end
end
