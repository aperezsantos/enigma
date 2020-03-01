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

  def test_it_can_split_into_key_subset_of_integers
    @enigma.stubs(:rand).returns(123)

    assert_equal [0, 1, 12, 23], @enigma.split_key
  end

  def test_it_can_generate_offset_with_given_date
    @enigma.stubs(:date).returns('080590')

    assert_equal [8, 1, 0, 0], @enigma.generate_offset('080590')
  end
end
