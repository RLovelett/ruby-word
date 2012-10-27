# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RubyWord/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-word"
  gem.version       = RubyWord::VERSION
  gem.authors       = ["Ryan Lovelett"]
  gem.email         = ["ryan@lovelett.me"]
  gem.description   = %q{Read, write and create Microsoft Word (2007/2010) documents in Ruby}
  gem.summary       = %q{RubyWord is a library written in Ruby that create word documents. No Windows operating system is needed for usage because the result are docx files (Office Open XML) that can be opened by all major office software.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "nokogiri", "~> 1.5.6"
  gem.add_dependency "zippy", "~> 0.2.1"

  gem.add_development_dependency "rspec", "~> 2.12.0"
  gem.add_development_dependency "rspec-xml", "~> 0.0.6"
  gem.add_development_dependency "guard-rspec", "~> 2.4.0"
  gem.add_development_dependency "rb-fsevent", "~> 0.9.3"
  gem.add_development_dependency "growl", "~> 1.0.3"
  gem.add_development_dependency "terminal-notifier-guard", "~> 1.5.3"
  gem.add_development_dependency "faker", "~> 1.1.2"
end
