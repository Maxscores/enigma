require_relative 'test_helper'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    key = KeyGenerator.new

    assert_instance_of KeyGenerator, key
  end

  def test_has_key_is_string
    new_key = KeyGenerator.new

    assert_instance_of String, new_key.key
  end

  def test_date_is_today
    new_key = KeyGenerator.new
    date = Date.new(2017, 10, 14)

    assert_equal 141017, new_key.date_code(date)
  end

  def test_month_is_not_single_digit
    new_key = KeyGenerator.new
    date = Date.new(2017, 1, 14)

    assert_equal 140117, new_key.date_code(date)
  end

  def test_year_is_not_single_digit
    new_key = KeyGenerator.new
    date = Date.new(2001, 1, 14)

    assert_equal 140101, new_key.date_code(date)
  end
end
