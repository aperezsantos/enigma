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

  def test_it_initializes_with_number_generator_object

    assert_equal NumberGenerator, @keys.number_generator.class
  end

  def test_it_has_way_to_save_generated_random_number

    assert_equal [], @keys.random_number
  end

  def test_it_can_save_generated_random_number
    number =  @number_generator.generate_random_number

    @keys.save_number(number)

   assert_equal [number], @keys.random_number
  end
end
