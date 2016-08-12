$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "booqmail/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "booqmail"
  s.version     = Booqmail::VERSION
  s.authors     = ["Kat Landreth"]
  s.email       = ["katlandreth@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Booqmail."
  s.description = "TODO: Description of Booqmail."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "figaro"
  s.add_dependency "jquery-rails"
  s.add_dependency 'bootstrap-sass', '~> 3.3.6'
  s.add_dependency 'sass-rails', '>= 3.2'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'responders', '~> 2.0'
  s.add_dependency 'gmail'
  s.add_dependency 'recaptcha'

  s.add_development_dependency "sqlite3"
end
