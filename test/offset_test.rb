require_relative 'test_helper'

class OffsetTest < Minitest::Test
  def test_offset_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_has_key_by_default
    offset = Offset.new

    assert offset.key
  end

  def test_argument_key_accepted
    offset = Offset.new('12345')

    assert_equal 12345, offset.key
  end

  def test_has_date_by_default
    offset = Offset.new

    assert_instance_of Date, offset.date
  end

  def test_argument_date_accepted
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_equal 141017, offset.date_code
  end

  def test_last_digits_of_squared_date_to_offset_array
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_equal [4, 2, 8, 9], offset.date_offset
  end

end
