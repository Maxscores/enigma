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
    output = [8,5,12,12,15]

    assert_equal output, decryptor.format_message(message)
  end

  def test_decrypt_characters
    decryptor = Decryptor.new()
    encrypted_message = "x4o15wz48 g"
    character_values = [24, 30, 15, 27, 31, 23, 26, 30, 34, 37, 7]
    key = "12345"
    date_code = '141017'
    offset = Offset.new(key, date_code).offset
    decrypted_message = decryptor.decrypt_characters(character_values, offset)

    assert_equal "hello world", decrypted_message.join
  end

  def test_decrypt_file
    decryptor = Decryptor.new()
    decrypted_message = decryptor.decrypt_file('data/test_decryption.txt', '12345', '141017')

    assert_equal "hello world", decrypted_message
  end

  def test_write_file
    decryptor = Decryptor.new()
    decryptor.write_file('data/test_write_file.txt', 'test text here')

    assert_equal 'test text here', File.open('data/test_write_file.txt', 'r').read
  end
end
