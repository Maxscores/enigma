require './lib/characters'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CharactersTest < Minitest::Test
  def test_it_exists
    characters = Characters.new

    assert_instance_of Characters, characters
  end

  def test_it_has_characters_by_default
    characters = Characters.new

    assert_equal 39, characters.characters.count
  end

  def test_key_returns_values
    characters = Characters.new

    assert_equal 12, characters.characters['l']
    assert_equal 12, characters.characters["l"]
    assert_equal 29, characters.characters["3"]
    assert_equal 37, characters.characters[" "]
  end


end
