source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# AUTENTIFICATION
gem 'devise'

# FOR ADMIN
gem 'activeadmin'
gem "active_admin-sortable_tree", "~> 2.0.0"
gem 'active_skin'

gem 'pg'
gem 'kaminari'

# style
gem 'bootstrap'

# MARKUP HTML
gem 'haml'
gem "html2haml"
# nested pages of admin
gem 'ancestry'
gem 'dotenv-rails'
# image management
gem 'carrierwave'

# duplicate record
gem 'amoeba'

# langs
gem 'globalize'
gem 'globalize-accessors'

# style
gem "font-awesome-sass", "~> 6.1.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem "acts_as_list"
group :development, :test do
  # Use mysql2 as the database for Active Record
  gem 'mysql2'
  gem 'awesome_print'
  gem 'pry'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]


  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "aws-sdk-s3", require: false

gem "figaro"
gem "fog-aws"

# gem 'rails_sortable'

gem "draper"

# SEO
gem 'canonical-rails', github: 'jumph4x/canonical-rails'
gem "dynamic_sitemaps"
