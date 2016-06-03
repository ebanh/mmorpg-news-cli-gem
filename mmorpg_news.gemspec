# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mmorpg_news/version'

Gem::Specification.new do |spec|
  spec.name          = "mmorpg_news"
  spec.version       = MmorpgNews::VERSION
  spec.authors       = ["ebanh"]
  spec.email         = ["ebanhernandez@gmail.com"]

  spec.summary       = %q{MMORPG News}
  spec.description   = %q{MMORPG News}
  spec.homepage      = "https://github.com/ebanh/mmorpg-news-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["mmorpg_news"]
  spec.require_paths = ["lib", "lib/mmorpg_news"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
