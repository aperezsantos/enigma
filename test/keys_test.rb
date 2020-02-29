require './test/test_helper'
require './lib/keys'

class KeysTest < Minitest::Test
  def setup
    @keys = Keys.new
  end

  def test_it_exists
    assert_instance_of Keys, @keys
  end

  def test_it_generates_random_number_as_string
    @keys.generate_random_number

    assert_equal String, @keys.generate_random_number.class
  end

  def test_random_number_generated_is_always_5_characters_long
    @keys.generate_random_number

    assert_equal 5, @keys.generate_random_number.length
  end
end
