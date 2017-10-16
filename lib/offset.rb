require './lib/key_generator'
require 'date'

class Offset
  attr_reader :key, :date

  def initialize(key, date=Date.today)
    @key = key
    @date = date
  end

  def date_code(date)
    if date.class == Date
      day, month, year = date.day, date.mon, date.year%100
      month = "%02d" % month.to_s
      year = "%02d" % year.to_s
      "#{day}#{month}#{year}".to_i
    elsif date.class == String
      date.to_i
    end
  end

  def date_offset
    squared = date_code(date)**2
    squared.digits.reverse[-4..-1]
  end

  def key_offset
    key_offset = []
    4.times do |time|
      key_offset << [key[time],key[time + 1]].join("").to_i
    end
    key_offset
  end
  #check enumerables in ruby

  def offset
    date_and_key = key_offset.zip(date_offset)
    date_and_key.map do |pair|
      pair.sum
    end
  end

end
