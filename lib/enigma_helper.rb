module EnigmaHelper
  def alpha
    ("a".."z").to_a << " "
  end

  def find_date
    Date.today.strftime("%d%m%y")
  end

  
end
