require './lib/key_generator'
require 'date'

class Offset
  attr_reader :key, :date_code, :date

  def initialize(key = KeyGenerator.new.key, date = Date.today)
    @key = key.to_i
    @date = date
    @date_code = KeyGenerator.new.date_code(date)
  end

  def date_offset
    date_offset  = []
    squared = date_code**2
    4.times do |time|
      date_offset << squared.digits[3 - time]
      # check for enumerables here for refactoring^
    end
    date_offset
  end

end
