source 'https://rubygems.org'

# Declare your gem's dependencies in suntech_rails.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

group :test do
  gem "minitest-rails"
  gem "minitest-rails-capybara"
  gem 'simplecov', :require => false
  gem "minitest-reporters"
  gem 'minitest-spec-rails'
  gem 'selenium-webdriver', '~> 2.47.1'
  gem "chromedriver-helper"
  gem 'minitest-logger'
end

group :development, :test do 
  gem 'byebug'
  gem 'pry-byebug'
end