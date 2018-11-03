class RotationFinder
  def self.find_key_pairs(key)
    key_pairs = []
    key.chars.each_cons(2) { |pair| key_pairs << pair.join.to_i }
    key_pairs
  end

  def self.find_date_numbers(date)
    squared_string = (date.to_i ** 2).to_s
    last_4_digits = squared_string[-4..-1].chars
    last_4_digits.map { |num_string| num_string.to_i }
  end

  def self.find_rotations(key, date)
    date_nums = find_date_numbers(date)
    key_pairs = find_key_pairs(key)
    key_pairs.map.with_index { |key_num, i| key_num + date_nums[i] }
  end
end
