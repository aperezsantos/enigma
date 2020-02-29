require './test/test_helper'
require './lib/number_generator'
require './lib/keys'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

end
