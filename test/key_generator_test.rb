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
end
