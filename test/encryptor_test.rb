require_relative 'test_helper'

class EncryptorTest < MiniTest::Test
  def test_class_initializes
    encryptor = Encryptor.new()

    assert_instance_of Encryptor, encryptor
  end

  def test_initializes_with_characters
    encryptor = Encryptor.new()

    assert_instance_of Hash, encryptor.characters
  end

  def test_format_message_works
    encryptor = Encryptor.new()
    message = "x4o15"
    output = [23, 29, 14, 26, 30]

    assert_equal output, encryptor.format_message(message)
  end

  def test_encrypt_characters
    encryptor = Encryptor.new()
    character_values = [7, 4, 11, 11, 14, 36, 22, 14, 17, 11, 3]
    offset = [16, 25, 42, 54]
    encrypted_message = encryptor.encrypt_characters(character_values, offset)

    assert_equal "x4p25x158 h", encrypted_message.join
  end

  def test_encrypt_integration
    encryptor = Encryptor.new()
    message = "hello world"
    key = '12345'
    date = Date.new(2017, 10, 14)
    message = encryptor.encrypt(message, key, date)

    assert_equal "x4p25x158 h", message
  end

  def test_encrypts_file_and_is_correct_length
    encryptor = Encryptor.new()
    encrypted_message = encryptor.encrypt_file('data/test_encryption.txt')
    original_message = "hello world"

    refute original_message == encrypted_message
  end

  def test_write_file
    encryptor = Encryptor.new()
    encryptor.write_file('data/test_write_file.txt', 'test text here')
    file = File.open('data/test_write_file.txt', 'r')
    file_text = file.read
    file.close

    assert_equal 'test text here', file_text
  end
end
