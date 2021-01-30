# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"
gem "rails", "~> 6.1.1"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

# end rails

group :development do
  gem "foreman"
  gem "annotate"
end

group :development, :test do
  gem "rubocop-rails_config", "~> 1.2", ">= 1.2.1"
  gem "rspec-rails", "~> 4.0", ">= 4.0.2"
  gem "factory_bot_rails", "~> 6.1"
end

group :test do
  gem "database_cleaner", "~> 1.8", ">= 1.8.5"
end

gem "jb", "~> 0.8.0"
