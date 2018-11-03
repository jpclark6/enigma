class Formatter
  def self.format_return(encrypted, numbers, date, encrypt_or_decrypt)
    {encrypt_or_decrypt => encrypted, key: numbers, date: date}
  end
end
