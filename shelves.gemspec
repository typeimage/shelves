# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'shelves/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Pete Browne']
  gem.email         = ['me@petebrowne.com']
  gem.description   = %q{The only responsive, fluid CSS grid with infinitely nestable columns.}
  gem.summary       = %q{The only responsive, fluid CSS grid with infinitely nestable columns.}
  gem.homepage      = 'https://github.com/petebrowne/shelves'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n").reject{ |f| File.fnmatch?('css/*', f) }
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'shelves'
  gem.require_paths = ['lib']
  gem.version       = Shelves::VERSION

  gem.add_runtime_dependency 'sass', '~> 3.2'
  gem.add_runtime_dependency 'choice', '~> 0.1'
  gem.add_development_dependency 'rake', '~> 10.0'
end
