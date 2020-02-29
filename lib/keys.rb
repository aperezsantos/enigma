class Keys
  attr_reader :number_generator, :random_number

  def initialize(number_generator)
    @number_generator = number_generator
    @random_number = []
  end

  def save_number(number)
    @random_number << number
  end

  def pair_number_characters
    paired_elements = []
    @random_number.flatten.each do |element|
      require "pry"; binding.pry
    end
    paired_elements
  end
end
