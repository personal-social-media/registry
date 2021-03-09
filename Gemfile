# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"
gem "rails", "~> 6.1.3"
gem "puma", "~> 5.2"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "bootsnap", ">= 1.4.4", require: false
gem "pg", "~> 1.2", ">= 1.2.3"

group :development do
  gem "web-console", ">= 4.1.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

# end rails

group :development do
  gem "foreman"
  gem "annotate"
  gem "git-version-bump", "~> 0.17.1"
end

group :development, :test do
  gem "rubocop-rails_config", "~> 1.3"
  gem "rspec-rails", "~> 4.0", ">= 4.0.2"
  gem "factory_bot_rails", "~> 6.1"
  gem "bundler-audit"
  gem "brakeman"
end

group :test do
  gem "database_cleaner", "~> 2.0"
end

group :production do
  gem "bugsnag"
end

gem "jb", "~> 0.8.0"
gem "hiredis", "~> 0.6.3", require: %w(redis redis/connection/hiredis)
gem "sidekiq", "~> 6.1", ">= 6.1.2", require: %w(sidekiq/web)
gem "async-http", require: %w(async/http/internet async/barrier)
gem "rack-cors"
gem "oj"
gem "rails_admin", "~> 2.1"
gem "base32", "~> 0.3.4"
