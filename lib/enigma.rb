class Enigma
  attr_reader :letters

  def initialize
    @letters = ('a'..'z').to_a.push(' ')
  end

  def generate_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def generate_date
    Time.new.strftime("%d%m%y")
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
    shifts = []
    shifts << split_key(key)[0] + generate_offset(date)[0]
    shifts << split_key(key)[1] + generate_offset(date)[1]
    shifts << split_key(key)[2] + generate_offset(date)[2]
    shifts << split_key(key)[3] + generate_offset(date)[3]
    shifts
  end

  def encrypt_letter(letter, shift_value)
    if @letters.include?(letter)
      index = @letters.index(letter)
      new_shift = index + shift_value
      @letters.rotate(new_shift).first
    else
      letter.downcase
    end
  end

  def decrypt_letter(letter, shift_value)
    if @letters.include?(letter)
      index = @letters.index(letter)
      new_shift = index - shift_value
      @letters.rotate(new_shift).first
    else
      letter.downcase
    end
  end

  def encrypt_message(message, key, date)
    transformed = []
    shifts = generate_shifts(key, date)
    message.chars.each do |letter|
      transformed << encrypt_letter(letter, shifts.first)
      shifts = shifts.rotate
    end
    transformed.join
  end

  def decrypt_ciphertext(ciphertext, key, date)
    decrypted = []
    shifts = generate_shifts(key, date)
    ciphertext.chars.each do |letter|
      decrypted << decrypt_letter(letter, shifts.first)
      shifts = shifts.rotate
    end
    decrypted.join
  end

  def encrypt(message, key = generate_key, date = generate_date)
    info = Hash.new
    info[:encryption] = encrypt_message(message, key, date)
    info[:key] = key
    info[:date] = date
    info
  end

  def decrypt(ciphertext, key, date = generate_date)
    info = Hash.new
    info[:decryption] = decrypt_ciphertext(ciphertext, key, date)
    info[:key] = key
    info[:date] = date
    info
  end
end
