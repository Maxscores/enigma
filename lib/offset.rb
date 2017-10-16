require './lib/key_generator'
require 'date'

class Offset
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
    # if date.class == Date
    #   @date_code = date_code(date)
    # elsif date.class == String
    #   @date_code = date.to_i
    # end
    #put something to allow date_code instead
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
    # date_offset  = []
    squared = date_code(date)**2
    # 4.times do |time|
    #   date_offset << squared.digits[3 - time]
    #   # check for enumerables here for refactoring^
    # end
    squared.digits.reverse[-4..-1].map {|offset| offset}
  end

  def key_offset
    key_offset = []
    4.times do |time|
      key_offset << [key[time],key[time + 1]].join("").to_i
    end
    key_offset
    # counter = (-1)
    # keys = key.split("")
    # keys.map do |key|
    #   counter += 1
    #   break if counter==4
    #   [keys[counter], keys[counter+1]].join("").to_i
    # end
  end

  def offset
    date_and_key = key_offset.zip(date_offset)
    offset = date_and_key.map do |pair|
      pair.sum
    end
  end

end
