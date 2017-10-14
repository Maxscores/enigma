class KeyGenerator
  attr_reader :key

  def initialize
    @key = rand(10000..99999)
  end

  def date_day_month_year
    t = Time.now
    day, month, year = t.day, t.mon, t.year%1000
    "#{day}#{month}#{year}".to_i
  end

end
