Gem::Specification.new do |spec|
  spec.name          = 'lita-onewheel-rekognition'
  spec.version       = '0.0.1'
  spec.authors       = ['Andrew Kreps']
  spec.email         = ['andrew.kreps@gmail.com']
  spec.description   = %q{Amazon Rekognition implementation}
  spec.summary       = %q{Amazon Rekognition implementation.}
  spec.homepage      = 'https://github.com/onewheelskyward/lita-onewheel-rekognition'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 4'
  spec.add_runtime_dependency 'rest-client', '~> 1'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 11'
  spec.add_development_dependency 'rack-test', '~> 0.6'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
