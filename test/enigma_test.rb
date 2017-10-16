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

  def test_enigma_has_key_by_default
    enigma = Enigma.new

    assert_instance_of String, enigma.random_key
  end

  def test_enigma_has_date_by_default
    enigma = Enigma.new

    assert_instance_of Date, enigma.default_date
  end

  def test_enigma_has_characters_by_default
    enigma = Enigma.new

    assert_instance_of Hash, enigma.characters
  end

  def test_formats_message
    enigma = Enigma.new

    assert_equal [20, 5, 24, 20],enigma.format_message("text")
  end

  def test_encrypts_characters
    enigma = Enigma.new
    encrypted = enigma.encrypt_characters([20, 5, 24, 20], [16, 25, 42, 54])

    assert_equal ["0","4","1","9"], encrypted
  end

  def test_encrypt_outputs_message
    enigma = Enigma.new

    assert_equal "x4o15wz48 g", enigma.encrypt("hello world", "12345", Date.today)
  end

  def test_decrypt_outputs_readable_message_default_date
    enigma = Enigma.new
    decrypted = enigma.decrypt("x4o15wz48 g", "12345")

    assert_equal "hello world", decrypted
  end

  def test_english_file_to_encryption
    enigma = Enigma.new
    enigma.default_date = Date.new(2017, 10, 14)
    enigma.random_key = "12345"

    assert_equal "x4o15wz48 g", enigma.encrypt_file('data/test_message.txt')
  end

  def test_decrypt_file_to_english
    enigma = Enigma.new
    enigma.default_date = Date.new(2017, 10, 14)
    enigma.random_key = "12345"
    test_output = enigma.decrypt_file('data/test_encrypted_message.txt',
                                      enigma.random_key,
                                      enigma.default_date)

    assert_equal "hello world", test_output
  end

  def test_writes_encrypted_file
    enigma = Enigma.new
    enigma.default_date = Date.new(2017, 10, 14)
    enigma.random_key = "12345"
    encrypted_text = enigma.encrypt_file('data/test_message.txt')
    enigma.write_file('data/encrypted.txt', encrypted_text)


    assert_equal "x4o15wz48 g", File.open('data/encrypted.txt', 'r').read
  end

  def test_writes_decrypted_file_to_english
    enigma = Enigma.new
    enigma.default_date = Date.new(2017, 10, 14)
    enigma.random_key = "12345"
    decrypted_text = enigma.decrypt_file('data/test_encrypted_message.txt',
                                      enigma.random_key,
                                      enigma.default_date)
    enigma.write_file('data/decrypted.txt', decrypted_text)

    assert_equal "hello world", File.open('data/decrypted.txt', 'r').read
  end

end
