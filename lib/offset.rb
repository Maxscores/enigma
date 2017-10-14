require './lib/key_generator'
require 'date'

class Offset
  attr_reader :key, :date_code, :date

  def initialize(key = KeyGenerator.new.key, date = Date.today)
    @key = key.to_i
    @date = date
    @date_code = KeyGenerator.new.date_code(date)
  end


end
