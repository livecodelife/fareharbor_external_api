# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fareharbor_external_api/version'

Gem::Specification.new do |spec|
  spec.name          = "fareharbor_external_api"
  spec.version       = FareharborExternalApi::VERSION
  spec.authors       = ["Caleb Cowen", "Zack Forbing", "David Tinianow"]
  spec.email         = ["calebcowen@gmail.com"]

  spec.summary       = %q{Gem to wrap FareHarbor's external API.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/Caleb9193/fareharbor_external_api"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency "webmock", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.10.0"

  spec.add_dependency "json", '~> 2.0'
  spec.add_dependency "faraday", '~> 0.9.0'
end
