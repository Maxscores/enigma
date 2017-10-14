require 'date'

class KeyGenerator
  attr_reader :key

  def initialize
    @key = rand(10000..99999)
  end

  def date_code(date)
    day, month, year = date.day, date.mon, date.year%100
    month = "%02d" % month.to_s
    year = "%02d" % year.to_s
    "#{day}#{month}#{year}".to_i
  end
end
