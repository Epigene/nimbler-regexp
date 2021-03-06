# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nimbler_regexp/version"

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.4.1', '< 2.5'
  spec.name          = "nimbler-regexp"
  spec.version       = NimblerRegexp::VERSION
  spec.authors       = ["Epigene"]
  spec.email         = ["augusts.bautra@gmail.com"]

  spec.summary       = "Regex matching monkeypatch in Nim"
  spec.description   = "Gem that overrides build-in #match? method with a faster Nim alternative"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|src|binaries)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi", "~> 1.9.18"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11.0"
end
