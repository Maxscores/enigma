require './lib/key_generator'
require 'date'

class Offset
  attr_reader :key, :date_code, :date

  def initialize(key, date)
    @key = key
    @date = date
    if date.class == Date
      @date_code = KeyGenerator.new.date_code(date)
    elsif date.class == String
      @date_code = date.to_i
    end
    #put something to allow date_code instead
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

  def key_offset
    key_offset = []
    4.times do |time|
      key_offset << [key[time],key[time + 1]].join("").to_i
    end
    key_offset
  end

  def offset
    date_and_key = key_offset.zip(date_offset)
    offset = date_and_key.map do |pair|
      pair.sum
    end
  end

end
