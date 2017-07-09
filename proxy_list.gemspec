# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proxy_list/version'

Gem::Specification.new do |spec|
  spec.name          = "proxy_list"
  spec.version       = ProxyList::VERSION
  spec.authors       = ["tatsunori_nishikori"]
  spec.email         = ["tora.1986.tatsu@gmail.com"]
  spec.summary       = "I get a free proxy from the Web"
  spec.description   = "get free proxy list"
  spec.homepage      = ""
  spec.required_ruby_version = '>= 1.9.3'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "capybara",'~> 2.4'
  spec.add_runtime_dependency 'poltergeist', '~> 1.10'
end
