class Enigma
  attr_reader :letters

  def initialize
    @letters = ('a'..'z').to_a.push(' ')
  end

  def generate_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def split_key(number)
    key = []
    number.chars.each_cons(2) do |character|
      key << character.join.to_i
    end
    key
  end


  def generate_offset(date)
    last_four_digits = (date.to_i ** 2).to_s.slice(-4..-1)
    last_four_digits.chars.map do |character|
      character.to_i
    end
  end

  def generate_shifts(key, date)
    shifts = {}
    shifts[:a] = split_key(key)[0] + generate_offset(date)[0]
    shifts[:b] = split_key(key)[1] + generate_offset(date)[1]
    shifts[:c] = split_key(key)[2] + generate_offset(date)[2]
    shifts[:d] = split_key(key)[3] + generate_offset(date)[3]
    shifts
  end


  def encrypt(message, key, date)
   split_key
   generate_offset
   require "pry"; binding.pry
 end
end
