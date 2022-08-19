
divider = "==================================================================================================".white

# Create new admin
puts divider
puts "Prepare... create Admin User".yellow
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.first.nil?
puts "Okee.. Done".cyan
puts divider
puts "Admin User : "
puts "email : admin@example.com"
puts "password : password"

puts divider
# Create page first time
puts "Prepare... create Page".yellow
Page.create!(title: 'Homepage', description: 'Homepage description', layout: 'home', position: '1') if Page.first.nil?
puts "Okee.. Done".cyan


puts divider
# Create setting first time
puts "Prepare... create Page".yellow
Setting.create!(name: 'Base') if Setting.first.nil?
puts "Okee.. Done".cyan