require_relative 'test_helper'

class EnigmaTest < Minitest::Test
  def test_enigma_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encryption_accepts_one_two_or_three_arguments
    enigma = Enigma.new

    assert enigma.encrypt("hello world")
    assert enigma.encrypt("hello world", "12345")
    assert enigma.encrypt("hello world", "12345", Date.today)
  end

  def test_encrypt_outputs_message
    enigma = Enigma.new

    assert_equal "x4p25x158 h", enigma.encrypt("hello world", "12345", Date.today)
  end

  def test_decrypt_outputs_readable_message_default_date
    enigma = Enigma.new
    decrypted = enigma.decrypt("x4p25x158 h", "12345")

    assert_equal "hello world", decrypted
  end

  def test_decryption_accepts_two_or_three_arguments
    enigma = Enigma.new

    assert enigma.decrypt("x4p25x158 h", "12345")
    assert enigma.decrypt("x4p25x158 h", "12345", Date.today)
  end

end
