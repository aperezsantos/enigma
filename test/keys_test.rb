require './test/test_helper'
require './lib/number_generator'
require './lib/keys'

class KeysTest < Minitest::Test
  def setup
    number_generator = NumberGenerator.new
    @keys = Keys.new(number_generator)
  end

  def test_it_exists
    assert_instance_of Keys, @keys
  end
end
