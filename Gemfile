source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

gem 'bootsnap', '>= 1.1.0', require: false
gem 'clearance'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.11'
gem 'redcarpet', '~> 3.4.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails', '~> 3.1.2'
gem 'spectre_scss'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

source 'https://rails-assets.org' do
  gem 'rails-assets-microplugin', '0.0.3'
  gem 'rails-assets-selectize', '0.12.4'
  gem 'rails-assets-sifter', '0.5.2'
end

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails'
  gem 'faker', '~> 1.8.4'
  gem 'rspec-rails', '~> 3.6'
end

group :development do
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-awesome_print'
  gem 'pry-rails'
  gem 'rack-livereload'
  gem 'rubocop', '~> 0.49.1', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers',
      git: 'https://github.com/thoughtbot/shoulda-matchers.git',
      branch: 'rails-5'
  gem 'simplecov', require: false
end
