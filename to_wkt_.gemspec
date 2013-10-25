# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_wkt_/version'

Gem::Specification.new do |spec|
  spec.name          = "to_wkt_"
  spec.version       = ToWkt::VERSION
  spec.authors       = ["Steven Dunlap"]
  spec.email         = ["steven@roadtrippers.com"]
  spec.description   = %q{Quickly and easily convert arrays to [Well-Known Text (WKT)] format.}
  spec.summary       = File.open('README.md').read  
  spec.homepage      = "http://github.com/roadtrippers/to_wkt_"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
