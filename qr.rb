# Write your solution here!
require "rqrcode"

pp "What would you like to encode in the generated QR code? Enter the number from the following options."
puts
pp "1. A URL"
pp "2. A wifi network"
pp "3. A text message"
puts
pp "Enter 4 to exit"
puts

user_input = gets.chomp

if user_input.include?("4")
  pp "Good bye!"
  exit
elsif user_input.include?("1")
  pp "What is the URL address you would like to encode?"
  puts
  
  text_to_encode = gets.chomp
  puts
elsif user_input.include?("2")
  pp "What is the name of the WIFI?"
  puts

  network_name = gets.chomp
  puts

  pp "What is the password?"
  puts

  network_password = gets.chomp
  puts

  text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{network_password};;"
elsif user_input.include?("3")
  pp "What is the phone number you want the code to send a text message to?"
  puts

  phone_number = gets.chomp
  puts

  pp "What is the message you want to send to this number?"
  puts

  sms_message = gets.chomp
  puts

  text_to_encode = "SMSTO:#{phone_number}:#{sms_message}"
else
  pp "Didn't recognize your selection. Please try again."
  exit
end

pp "What would you like to call the PNG?"
puts

filename = gets.chomp
puts

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new(text_to_encode)

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("#{filename}.png", png.to_s)
