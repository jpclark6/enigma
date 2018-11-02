require './lib/rotation_finder'

class Enigma
  def alpha
    ("a".."z").to_a << " "
  end

  def encrypt(string, numbers = find_random_key, date = find_date)
    rotations = RotationFinder.find_rotations(numbers, date)
    encrypted = cycle_string(string, rotations)
    format_return(encrypted, numbers, date, :encryption)
  end

  def decrypt(string, numbers, date = find_date)
    rotations = RotationFinder.find_rotations(numbers, date)
    rotations.map! { |rotation| - rotation }
    decrypted = cycle_string(string, rotations)
    format_return(decrypted, numbers, date, :decryption)
  end

  def format_return(encrypted, numbers, date, encrypt_or_decrypt)
    {encrypt_or_decrypt => encrypted, key: numbers, date: date}
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

  def find_random_key
    key = ""
    5.times { key << rand(10).to_s }
    key
  end
end
