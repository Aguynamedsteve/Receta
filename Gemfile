source 'https://rubygems.org'

gem 'rails', '4.0.3'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :test, :development do
  gem 'pry-rails'
  gem 'faker'
end

group :test do
  gem "rspec"
  gem "rspec-rails", "~> 2.0"
  gem "factory_girl_rails", "~> 4.0"
  gem "capybara"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem 'guard-rspec'
  gem 'growl'
end

gem 'devise'
gem 'bootstrap-sass', '~> 3.2.0.0'
gem 'bootstrap'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'turbolinks'
gem 'coveralls', require: false

group :doc do
  gem 'sdoc', require: false
end
