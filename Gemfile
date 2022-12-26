# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.1.3"

gem "rails", "~> 6.1.4"

gem "bootsnap", ">= 1.4.6", require: false
gem "bootstrap", "~> 4.3", ">= 4.3.1"
gem "devise", "~> 4.8"
gem "devise-bootstrap-views", "~> 1.0"
gem "devise-i18n"
gem "font-awesome-sass", "~> 5.12.0", ">= 5.12.0"
gem "jsbundling-rails"
gem "metainspector"
gem "name_of_person", "~> 1.0"
gem "pagy", "~> 2.1.2"
gem "pg"
gem "puma", "~> 5.6"
gem "redcarpet", "~> 3.5.0"
gem "redis", "~> 4.0"
gem "rouge"
gem "sassc", "2.1.0"
gem "sass-rails", ">= 6"
gem "slim-rails", "~> 3.2.0"
gem "turbo-rails"

group :development, :test do
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "factory_bot_rails"
  gem "faker"
  gem "letter_opener_web", "~> 2.0"
  gem "rspec-rails"
end

group :development do
  gem "bullet"
  gem "guard"
  gem "guard-rspec", require: false
  gem "guard-rubocop"
  gem "pry-awesome_print"
  gem "pry-rails"
  gem "rubocop", ">= 1.37.1"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "ruby-lsp", "~> 0.3.7"
  gem "simplemde-rails"
  gem "web-console"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "rspec_junit_formatter"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 4.3.0"
  gem "webdrivers"
end
