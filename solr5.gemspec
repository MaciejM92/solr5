# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solr5/version'

Gem::Specification.new do |spec|
  spec.name          = "solr5"
  spec.version       = Solr5::VERSION
  spec.authors       = ["Tobiasz Małecki"]
  spec.email         = ["tobiasz.malecki@besidethepark.com"]
  spec.summary       = %q{Adds usefull rake tasks for solr5}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails'
  spec.add_dependency 'railties'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
