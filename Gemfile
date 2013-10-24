source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'devise'
gem "paperclip", "~> 3.0"
gem "twitter-bootstrap-rails", "~> 2.2.8"
gem 'annotate', ">=2.5.0"

group :test do
	gem "email_spec"
	gem "rspec-rails",        ">= 2.11.4"
	gem "database_cleaner",   ">= 0.9.1"
	gem "cucumber-rails",     ">= 1.3.0"
	gem "capybara",           ">= 1.1.3"
  gem "capybara-webkit"
  gem "factory_girl_rails", ">= 4.1.0"
end

group :development do
  gem 'sqlite3'
  gem "mailcatcher", "~> 0.5.12"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
