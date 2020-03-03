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
    # @enigma.stubs(:rand).returns(123)
    # @enigma.stubs(:rand).returns(123)

    assert_equal [2, 27, 71, 15], @enigma.split_key('02715')
  end

  def test_it_can_generate_offset_with_given_date
    # skip
    # @enigma.stubs(:rand).returns(123)
    # @enigma.stubs(:date).returns('080590')

    assert_equal [1, 0, 2, 5], @enigma.generate_offset("040895")
  end

  def test_it_can_generate_shifts
    # skip
    # @enigma.stubs(:rand).returns(123)
    # @enigma.stubs(:date).returns('080590')

    assert_equal [3, 7, 73, 20], @enigma.generate_shifts("02715", "040895")
  end

  def test_it_can_transform_letter_to_related_encryption

    assert_equal "i", @enigma.transform_letter("h", 28)
    assert_equal "!", @enigma.transform_letter("!", 15)
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
