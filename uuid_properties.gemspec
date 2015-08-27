# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uuid_properties/version'

Gem::Specification.new do |spec|
  spec.name          = "uuid_properties"
  spec.version       = UuidProperties::VERSION
  spec.authors       = ["Heroku"]
  spec.email         = ["conway@heroku.com"]

  spec.summary       = %q{Generate and find by UUIDs in ActiveRecord models}
  spec.description   = %q{Generate and find by UUIDs in ActiveRecord models}
  spec.homepage      = "https://github.com/heroku/uuid_properties"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
