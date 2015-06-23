# -*- encoding: utf-8 -*-

require File.expand_path('../lib/iupac/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "iupac"
  gem.version       = Iupac::VERSION
  gem.summary       = %q{ Summary}
  gem.description   = %q{ Description}
  gem.license       = "MIT"
  gem.authors       = ["Sheena Gupta, Mohit Gautam ,Pierre Tremouilhac"]
  gem.email         = "p.tremouilhac@gmail.com"
  gem.homepage      = "http://www.chemotion.net"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rdoc', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end
