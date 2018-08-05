lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simple_iugu/version"

Gem::Specification.new do |spec|
  spec.name          = "simple_iugu"
  spec.version       = SimpleIugu::VERSION
  spec.authors       = ["Henrique Januário"]
  spec.email         = ["riquejanuario@jera.com.br"]

  spec.summary       = "Iugu Gem"
  spec.description   = ""
  spec.homepage      = "https://github.com/henriqjanuario/iugu-simple"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.12.1'
  spec.add_dependency 'byebug', "~> 10.0.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
