$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "polaris_view_helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "polaris_view_helpers"
  s.version     = PolarisViewHelpers::VERSION
  s.authors     = ["Jeremy Green"]
  s.email       = ["jeremy@octolabs.com"]
  s.homepage    = "http://www.octolabs.com/"
  s.summary     = "Rails helpers for Shopify Polaris."
  s.description = "Rails helpers for Shopify Polaris."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
