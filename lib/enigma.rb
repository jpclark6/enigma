class Enigma
  def alpha
    ("a".."z").to_a << " "
  end

  def encrypt(string, numbers, date = find_date)
  end

  def find_date
    Date.today.strftime("%d%m%y")
  end

end
