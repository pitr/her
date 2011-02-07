# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'her/version'

Gem::Specification.new do |s|
  s.name        = "her"
  s.version     = Her::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pitr Vernigorov"]
  s.email       = ["pitr.vern@gmail.com"]
  s.homepage    = "http://pitr.github.com/her"
  s.summary     = "Full featured deployment tool in 200 lines of ruby code"
  s.description = "Deploys your rack app in a git repository to a unix server with nginx and unicorn"

  s.add_development_dependency "rocco"

  s.files        = %w(bin/her lib/her/version.rb index.html README)
  s.executable   = 'her'
end
