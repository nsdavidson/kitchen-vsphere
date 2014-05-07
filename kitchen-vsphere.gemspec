# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitchen/driver/vsphere_version'

Gem::Specification.new do |spec|
  spec.name          = 'kitchen-vsphere'
  spec.version       = Kitchen::Vsphere::VERSION
  spec.authors       = ['Nolan Davidson']
  spec.email         = ['nolan.davidson@gmail.com']
  spec.description   = 'Provides a test kitchen driver for vSphere'
  spec.summary       = 'Enables provisioning of test machines on VMware'
  spec.homepage      = ''
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'test-kitchen', '~> 1.0'
  spec.add_dependency 'fog'
  spec.add_dependency 'nokogiri', '1.5.5'
  spec.add_dependency 'rbvmomi', '1.6.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
end
