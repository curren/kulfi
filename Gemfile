source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# to try fixing rake error
gem 'nokogiri'

gem 'devise'

gem 'activeadmin'

gem 'sass-rails',   '~> 3.2.3'

gem 'meta_search', '>= 1.1.0.pre'

gem 'jquery-rails'

gem 'geocoder'

gem 'therubyracer'	#needed to get rid of javascipt runtime error

# To use ActiveModel has_secure_password
# TODO Verify that this is not required
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :production do
  gem 'pg'
  gem 'thin'
end

group :development do
 gem 'rspec-rails'
  # To use debugger
  # gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
 gem 'rspec-rails'
 gem 'database_cleaner'
 gem 'factory_girl_rails'
 gem 'cucumber-rails'
 gem 'capybara'
 gem 'database_cleaner'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end
