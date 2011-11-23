#!/usr/bin/env rake
require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'spree_core/testing_support/common_rake'

#require "bundler/gem_tasks"

RSpec::Core::RakeTask.new

task :default => :spec

spec = eval(File.read('spree_flexi_rate_shipping.gemspec'))

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
end

Bundler::GemHelper.install_tasks

desc "Generates a dummy app for testing"
task :test_app do 
  ENV['LIB_NAME'] = "spree_flexi_rate_shipping"
  Rake::Task['common:test_app'].invoke
end

