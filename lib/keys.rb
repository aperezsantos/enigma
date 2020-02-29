class Keys
  attr_reader :number_generator, :random_number

  def initialize(number_generator)
    @number_generator = number_generator
    @random_number = []
  end
end
