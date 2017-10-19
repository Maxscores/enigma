require 'simplecov'
SimpleCov.start

require './lib/key_generator'
require './lib/characters'
require './lib/offset'
require './lib/cracker'
require './lib/decryptor'
require './lib/enigma'

require 'minitest/autorun'
require 'minitest/pride'

require 'date'
require 'pry'
