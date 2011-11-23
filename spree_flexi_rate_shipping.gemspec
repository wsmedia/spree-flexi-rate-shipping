# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spree/flexi_rate_shipping/version', __FILE__)

Gem::Specification.new do |gem|
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Chris Boertien"]
  gem.email         = ["chris.boertien@gmail.com"]
  gem.description   = %q(Provides flexible shipping rate configuration)
  gem.summary       = %q(Provides flexible shipping rate configuration.)
  gem.homepage      = "http://github.com/BZLabs/spree-flexi-rate-shipping"
  gem.required_ruby_version = '>= 1.8.7'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "spree_flexi_rate_shipping"
  gem.require_paths = ["lib"]
  gem.version       = SpreeFlexiRateShipping::VERSION
  gem.requirements << 'none'
  gem.add_dependency 'spree_core', '>= 0.70.1'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'sqlite3'
end

