require './test/test_helper'
require './lib/number_generator'
require './lib/keys'

class KeysTest < Minitest::Test
  def setup
    @number_generator = NumberGenerator.new
    @keys = Keys.new(@number_generator)
  end

  def test_it_exists
    assert_instance_of Keys, @keys
  end

  def test_it_has_way_to_save_random_number

    assert_equal [], @keys.random_number
  end
end
