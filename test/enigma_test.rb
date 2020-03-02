require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e",
                "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o",
                "p", "q", "r", "s", "t",
                "u", "v", "w", "x", "y",
                "z", " "]

    assert_equal expected, @enigma.letters
  end

  def test_it_generates_key_as_a_string_integer
    @enigma.stubs(:rand).returns(123)

    assert_equal "00123", @enigma.generate_key
  end

  def test_it_can_split_into_key_subset_of_integers
    @enigma.stubs(:rand).returns(123)
    # @enigma.stubs(:rand).returns(123)

    assert_equal [2, 27, 71, 15], @enigma.split_key('02715')
  end

  def test_it_can_generate_offset_with_given_date
    @enigma.stubs(:date).returns('080590')

    assert_equal [8, 1, 0, 0], @enigma.generate_offset('080590')
  end

  def test_it_can_generate_shifts
    @enigma.stubs(:rand).returns(123)
    @enigma.stubs(:date).returns('080590')

    expected = {a: 8, b: 2, c: 12, d: 23}

    assert_equal expected, @enigma.generate_shifts
  end

  def test_enigma_encrypts_message_given_key_date
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
end
