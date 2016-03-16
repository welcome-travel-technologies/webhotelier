# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webhotelier/version'

Gem::Specification.new do |spec|
  spec.name          = 'webhotelier'
  spec.version       = Webhotelier::VERSION
  spec.authors       = ['Maxim Pechnikov']
  spec.email         = ['parallel588@gmail.com']
  spec.license = "MIT"
  spec.summary       = %q{A simple client library to remotely access the Webhotelier API.}
  spec.description   = %q{Easy interface between ruby for https://www.webhotelier.net/.}
  spec.homepage      = 'https://github.com/parallel588/webhotelier'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com/parallel588/webhotelier'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('virtus', '~> 1.0', '>= 1.0.5')
  spec.add_runtime_dependency('json', '~> 1.8')
  spec.add_runtime_dependency('faraday', '~> 0.9.0')
  spec.add_runtime_dependency('faraday_middleware', '~> 0.10.0')
  spec.add_runtime_dependency('activesupport', ['>= 3.1', '<= 5.0'])

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10.3'
end
