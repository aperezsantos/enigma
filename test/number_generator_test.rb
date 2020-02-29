require './test/test_helper'
require './lib/number_generator'

class NumberGeneratorTest < Minitest::Test
  def test_it_exists
    number_generator = NumberGenerator.new

    assert_instance_of NumberGenerator, number_generator
  end

  def test_it_generates_random_number_as_string
    number_generator = NumberGenerator.new

    number_generator.generate_random_number

    assert_equal String, number_generator.generate_random_number.class
  end

  def test_random_number_generated_is_always_5_characters_long
    number_generator = NumberGenerator.new

    number_generator.generate_random_number

    assert_equal 5, number_generator.generate_random_number.length
  end

end
