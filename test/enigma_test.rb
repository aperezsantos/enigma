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

    assert_equal [3, 27, 73, 20], @enigma.generate_shifts("02715", "040895")
  end

  def test_it_can_encrypt_message
    # skip
    assert_equal "keder ohulw", @enigma.encrypt_message("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_ciphertext
    # skip
    assert_equal "hello world", @enigma.decrypt_ciphertext("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_letter_to_related_encryption
    assert_equal "j", @enigma.encrypt_letter("h", 2)
    assert_equal "!", @enigma.encrypt_letter("!", 15)
  end

  def test_it_can_decrypt_ciphertext_to_related_encryption
    assert_equal "f", @enigma.decrypt_letter("h", 2)
  end

  def test_enigma_encrypts_message_given_key_date
    # skip
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_decrypts_message_given_key_date
    # skip
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
