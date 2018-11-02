class RotationFinder
  def self.find_number_pairs(numbers)
    number_pairs = []
    numbers.chars.each_cons(2) { |pair| number_pairs << pair.join.to_i }
  end


end
