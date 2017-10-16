require 'date'

class KeyGenerator
  attr_reader :key

  def initialize
    @key = rand(10000..99999).to_s
  end
end
