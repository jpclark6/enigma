require './lib/rotation_finder'

class Enigma
  def alpha
    ("a".."z").to_a << " "
  end

  def encrypt(string, numbers, date = find_date)
    rotations = RotationFinder.find_rotations(numbers, date)
    encrypted = cycle_string(string, rotations)
    format_return(encrypted, numbers, date)
  end

  def format_return(encrypted, numbers, date)
    {encryption: encrypted, key: numbers, date: date}
  end

  def find_date
    Date.today.strftime("%d%m%y")
  end

  def cycle_string(string, rotations)
    encrypted_string = ""
    string.chars.each_with_index do |char, i|
      char_location = alpha.index(char)
      num_to_add = rotations[i % rotations.count]
      letter = alpha[(char_location + num_to_add) % alpha.length]
      encrypted_string << letter
    end
    encrypted_string
  end
end
