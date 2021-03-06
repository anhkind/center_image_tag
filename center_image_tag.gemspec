# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'center_image_tag/version'

Gem::Specification.new do |spec|
  spec.name          = "center_image_tag"
  spec.version       = CenterImageTag::VERSION
  spec.authors       = ["Anh Nguyen"]
  spec.email         = ["anhkind@gmail.com"]
  spec.description   = "center_image_tag helps your Rails app to center your images easily with pure css."
  spec.summary       = "Center your images with pure css."
  spec.homepage      = "https://github.com/anhkind/center_image_tag"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "vendor"]

  spec.add_dependency 'actionpack', '>= 3.0'
  #spec.add_dependency 'railties',   ">= 3.1"

  spec.add_development_dependency 'rake',          '>= 0.9.2'
  spec.add_development_dependency 'rspec',         '~> 2.12'
  spec.add_development_dependency 'rspec-mocks',   '>= 2.12.1'
  spec.add_development_dependency 'rspec-rails',   '~> 2.12'
end
