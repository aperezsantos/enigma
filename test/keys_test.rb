require './test/test_helper'
require './lib/keys'

class KeysTest < Minitest::Test
  def test_it_exists
    keys = Keys.new

    assert_instance_of Keys, keys
  end

  def test_it_generates_random_number_as_string
    keys = Keys.new

    keys.generate_random_number

    assert_equal String, keys.generate_random_number.class
  end
end
