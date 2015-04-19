$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "snapuser/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "snapuser"
  spec.version     = Snapuser::VERSION
  spec.authors     = ["khcr"]
  spec.email       = ["kocher.ke@gmail.com"]
  spec.homepage    = "https://github.com/khcr/snapuser"
  spec.summary     = "A rails engine to add a simple authentification and permission system."
  spec.description = spec.summary
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  spec.add_dependency "rails", "~> 4.2.1"
  spec.add_dependency "bcrypt-ruby", "~> 3.1.0"
  spec.add_dependency "snaptable"
  spec.add_dependency "sass-rails", "~> 4.0.3"

  spec.add_development_dependency "sqlite3"
end
