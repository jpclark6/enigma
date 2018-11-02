class RotationFinder
  def self.find_number_pairs(numbers)
    number_pairs = []
    numbers.chars.each_cons(2) { |pair| number_pairs << pair.join.to_i }
    number_pairs
  end

  def self.find_date_numbers(date)
    squared_string = (date.to_i ** 2).to_s
    last_4 = squared_string[-4..-1].chars
    last_4.map { |num_string| num_string.to_i }
  end
end
