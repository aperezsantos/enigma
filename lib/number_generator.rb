class NumberGenerator
  
  def generate_random_number
    rand(0..99999).to_s.rjust(5, '0')
  end
end
