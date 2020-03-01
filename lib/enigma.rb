class Enigma
  def generate_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def split_key
    key = generate_key
    key_subset = []
    key.chars.each_cons(2) do |character|
      key_subset << character.join.to_i
    end
    key_subset
  end

  def generate_offset(date)
    squared = date.to_i ** 2
    offset_subset = squared.to_s.slice(-4..-1).chars
    offset_subset.map do |character|
      character.to_i
    end
  end
end
