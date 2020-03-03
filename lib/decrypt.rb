require './lib/enigma'
require './lib/encrypt'

enigma = Enigma.new
path = "/Users/aperezsantos/turing/1_mod/projects/enigma/encrypted.txt"
encrypted_file = File.open(path, 'r')
encrypted_message = encrypted_file.read
encrypted_file.close

# must add key and date for this to work
# decryption_info_hash = enigma.decrypt(encrypted_message, KEY, DATE)
decrypted_message = decryption_info_hash[:decryption]

decrypted_file_path = "/Users/aperezsantos/turing/1_mod/projects/enigma/decrypted.txt"
decrypted_file = File.open(decrypted_file_path, 'w')
decrypted_file.write(decrypted_message)
decrypted_file.close

puts "Created #{decrypted_message} in the #{decrypted_file_path} with the key #{decryption_info_hash[:key]} and date #{decryption_info_hash[:date]}."
