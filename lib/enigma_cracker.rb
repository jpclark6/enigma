require './lib/enigma'

class EnigmaCracker
  def crack(encryption, date)
    e = Enigma.new
    all_key_combos.each_with_index do |key, i|
      # if i%1000 == 0
      #   puts "Trying! Iteration #{i}, key: #{key.join}"
      # end
      data = e.decrypt(encryption, key.join, date)
      return data if data[:decryption][-4..-1] == " end"
    end
  end

  def all_key_combos
    ("0".."9").to_a.repeated_permutation(5)
  end
end
