require_relative 'test_helper'

class EncryptTest < Minitest::Test
  def test_encrypt_exists
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end

  

end
