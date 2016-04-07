# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'periodic_thunderstorms/version'

Gem::Specification.new do |spec|
  spec.name          = "periodic_thunderstorms"
  spec.version       = PeriodicThunderstorms::VERSION
  spec.authors       = ["Jeff Sandberg"]
  spec.email         = ["paradox460@gmail.com"]

  spec.summary       = 'A rubygem for CloudElements'
  spec.description   = 'Gem providing a nice api for interacting with CloudElements. Bring your umbrella!'
  spec.homepage      = "https://github.com/sendsonar/periodic_thunderstorms"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.2"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "pry-rescue"

  spec.add_dependency 'http_api_builder'
  spec.add_dependency 'http'
  spec.add_dependency 'require_all'

end
