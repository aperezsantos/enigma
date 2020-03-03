require './lib/enigma'

enigma = Enigma.new
path = "/Users/aperezsantos/turing/1_mod/projects/enigma/message.txt"
message_file = File.open(path, 'r')
message = message_file.read
message_file.close

encryption_hash_info = enigma.encrypt(message)
encrypted_message = encryption_hash_info[:encryption]

encrypted_file_path = "/Users/aperezsantos/turing/1_mod/projects/enigma/encrypted.txt"
encrypted_file = File.open(encrypted_file_path, 'w')
encrypted_file.write(encrypted_message)
encrypted_file.close
require "pry"; binding.pry

puts "Created #{encrypted_message} in the #{encrypted_file_path} with the key #{encryption_hash_info[:key]} and date #{encryption_hash_info[:date]}."
