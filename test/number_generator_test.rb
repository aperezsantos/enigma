require './test/test_helper'
require './lib/number_generator'

class NumberGeneratorTest < Minitest::Test
  def test_it_exists
    number_generator = NumberGenerator.new

    assert_instance_of NumberGenerator, number_generator
  end
end
