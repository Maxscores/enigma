require_relative 'test_helper'

class OffsetTest < Minitest::Test
  def test_offset_exists
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_instance_of Offset, offset
  end

  def test_has_key_by_default
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert offset.key
  end

  def test_argument_key_accepted
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_equal '12345', offset.key
  end

  def test_has_date_by_default
    offset = Offset.new('12345')

    assert_equal Date.today, offset.date
  end

  def test_argument_date_accepted
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_equal 141017, offset.date_code(offset.date)
  end

  def test_last_digits_of_squared_date_to_offset_array
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_equal [4, 2, 8, 9], offset.date_offset
  end

  def test_key_offset_is_an_array
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_equal [12, 23, 34, 45], offset.key_offset
  end

  def test_total_of_offsets
    offset = Offset.new('12345', Date.new(2017,10,14))

    assert_equal [16, 25,42, 54], offset.offset
  end

#different date inputs

end
