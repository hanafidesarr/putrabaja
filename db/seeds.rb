
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.first.nil?
Page.create!(title: 'Homepage', description: 'Homepage description', layout: 'home', position: '1') if Page.first.nil?
Setting.create!(name: 'Base') if Setting.first.nil?