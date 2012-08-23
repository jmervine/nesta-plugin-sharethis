# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nesta-plugin-sharethis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joshua Mervine"]
  gem.email         = ["joshua@mervine.net"]
  gem.description   = %q{Adds ShareThis features to Nesta CMS.}
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/jmervine/nesta-plugin-sharethis"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nesta-plugin-sharethis"
  gem.require_paths = ["lib"]
  gem.version       = Nesta::Plugin::Sharethis::VERSION
  gem.add_dependency("nesta", ">= 0.9.11")
  gem.add_development_dependency("yard")
  gem.add_development_dependency("rake")
end
