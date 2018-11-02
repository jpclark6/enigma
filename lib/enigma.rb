require './lib/rotation_finder'

class Enigma
  def alpha
    ("a".."z").to_a << " "
  end

  def encrypt(string, numbers, date = find_date)
    rotations = RotationFinder(numbers, date)
    encrypted = cycle_string(string, rotations)
    format_return(encrypted, numbers, date)
  end

  def find_date
    Date.today.strftime("%d%m%y")
  end

end
