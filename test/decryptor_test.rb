require_relative 'test_helper'

class DecryptorTest < Minitest::Test
  def test_class_initializes
    decryptor = Decryptor.new()

    assert_instance_of Decryptor, decryptor
  end

  def test_initializes_with_characters
    decryptor = Decryptor.new()

    assert_instance_of Hash, decryptor.characters
  end

  def test_format_message_works
    decryptor = Decryptor.new()
    message = "hello"
    output = [7, 4, 11, 11, 14]

    assert_equal output, decryptor.format_message(message)
  end

  def test_decrypt_characters
    decryptor = Decryptor.new()
    character_values = [23, 29, 15, 27, 30, 23, 26, 30, 33, 36, 7]
    offset = [16, 25, 42, 54]

    decrypted_message = decryptor.decrypt_characters(character_values, offset)

    assert_equal "hello world", decrypted_message.join
  end

  def test_decrypt_integration
    decryptor = Decryptor.new()
    encrypted_message = "x4p25x158 h"
    key = '12345'
    date = Date.new(2017, 10, 14)
    message = decryptor.decrypt(encrypted_message, key, date)

    assert_equal "hello world", message
  end

  def test_decrypt_file
    decryptor = Decryptor.new()
    decrypted_message = decryptor.decrypt_file('data/test_decryption.txt',
                                               '12345',
                                               '141017')

    assert_equal "hello world", decrypted_message
  end

  def test_write_file
    decryptor = Decryptor.new()
    decryptor.write_file('data/test_write_file.txt', 'test text here')
    file = File.open('data/test_write_file.txt', 'r')
    file_text = file.read
    file.close

    assert_equal 'test text here', file_text
  end
end
