# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'shelves/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Pete Browne']
  gem.email         = ['me@petebrowne.com']
  gem.description   = %q{The only responsive, fluid CSS grid with infinitely nestable columns.}
  gem.summary       = %q{The only responsive, fluid CSS grid with infinitely nestable columns.}
  gem.homepage      = ''

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'shelves'
  gem.require_paths = ['lib']
  gem.version       = Shelves::VERSION
  
  gem.add_runtime_dependency     'sass',           '~> 3.1'
  gem.add_runtime_dependency     'compass',        '~> 0.12'
  gem.add_development_dependency 'sprockets',      '~> 2.3'
  gem.add_development_dependency 'sprockets-sass', '~> 0.7'
end
