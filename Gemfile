source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.2"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "jwt"
gem "pg", "~> 1.1"
gem "pry-doc"
gem "pry-rails"
gem "puma", "~> 5.0"
gem "rest-client"
gem "tzinfo-data"
gem 'redis', '~> 4.2'
gem 'redis-namespace'
gem 'sidekiq'
gem 'sidekiq-history'
gem 'sidekiq-limit_fetch'

group :development, :test do
  gem "brakeman"
  gem "bundle-audit"
  gem "debug"
  gem "factory_bot_rails"
  gem "faker"
  gem "guard"
  gem "guard-rspec"
  gem "rspec-rails", "~> 4.0.0"
  gem "rubocop"
  gem "spring-commands-rspec"
  gem "webmock"
end

group :development do
  gem "listen", "~> 3.3"
  gem "rails-erd"
  gem "spring"
  gem "spring-watcher-listen"
end
