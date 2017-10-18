require_relative 'test_helper'
# need to write more tests with another key/encryption combo
class CrackerTest < Minitest::Test
  def test_it_exist
    cracker = Cracker.new

    assert_instance_of Cracker, cracker
  end

  def test_initializes_with_characters_by_default
    cracker = Cracker.new

    assert_instance_of Hash, cracker.characters
    assert_equal 39, cracker.characters.count
  end

  def test_encrypted_end_values
    cracker = Cracker.new
    encryption = "cl8sjefvmsze7f1u.fu"
    crack_offset = (-3)
    result = cracker.encrypted_end_values(encryption, crack_offset)
    expected = [32, 5, 26, 20]

    assert_equal expected, result
  end

  def test_known_end_values
    cracker = Cracker.new
    crack_offset = (-3)
    result = cracker.known_end_values(crack_offset)
    expected = [37, 37, 4, 13]

    assert_equal expected, result
  end

  def test_offset_finder
    cracker = Cracker.new
    encrypted_end_values = [33, 6, 27, 21]
    known_end_values = [38, 38, 5, 14]
    result = cracker.offset_finder(encrypted_end_values, known_end_values)
    expected_key = [33, 6, 22, 7]

    assert_equal expected_key, result
  end

  def test_crack
    cracker = Cracker.new
    encryption = "qskfxmvi1zc5indhmn "
    message = "hello world ..end.."

    assert_equal message, cracker.crack(encryption, '161017')
  end


end
