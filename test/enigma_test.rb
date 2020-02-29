require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_generates_key_as_a_string_integer
    @enigma.stubs(:rand).returns(123)

    assert_equal "00123", @enigma.generate_key
  end
end
