# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spree/flexi_rate_shipping/version', __FILE__)

Gem::Specification.new do |gem|
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Chris Boertien", "Ryan Siddle"]
  gem.email         = ["chris.boertien@gmail.com", "ryansiddle@googlemail.com"]
  gem.description   = %q(Provides flexible shipping rate configuration)
  gem.summary       = %q(Provides flexible shipping rate configuration.)
  gem.homepage      = "http://github.com/BZLabs/spree-flexi-rate-shipping"
  gem.required_ruby_version = '>= 1.9.3'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "spree_flexi_rate_shipping"
  gem.require_paths = ["lib"]
  gem.version       = SpreeFlexiRateShipping::VERSION
  gem.requirements << 'none'
  gem.add_dependency 'spree_core', '>= 1.1.3'
  gem.add_development_dependency 'rspec-rails'
end

