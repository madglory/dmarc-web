source 'https://rubygems.org'

gem 'rails', '3.2.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "pg"

gem 'pry-rails'
gem 'rspec'
gem 'resque'

group :test, :development do
  gem "rspec-rails", "~> 2.0"
  #gem "mongoid-rspec"
  gem "capybara"
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'growl'
  gem 'faker'
  gem 'guard-rspec'
end

group :development do
  gem 'heroku'
end

# Authentication & Authorization
gem 'devise'
#gem 'cancan'

# Frontend
gem "kaminari"

# Process management
gem "foreman"

# Parsing
gem 'zipruby'
gem "nokogiri"
gem "sax-machine", "~> 0.2.0.rc1"

# Uploads
gem 'carrierwave'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.0.3'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
