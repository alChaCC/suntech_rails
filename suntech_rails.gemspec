$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "suntech_rails/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "suntech_rails"
  s.version     = SuntechRails::Core::VERSION
  s.authors     = ["aloha"]
  s.email       = ["y.alohac@gmail.com"]
  s.homepage    = "https://github.com/alChaCC/suntech_rails"
  s.summary     = "Suntech API for Rails"
  s.description = "Suntech API for Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
