# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'czech_post/code_generator/version'

Gem::Specification.new do |spec|
  spec.name                  = 'czech-post-code-generator'
  spec.version               = CzechPost::CodeGenerator::VERSION
  spec.authors               = ['Adam Martinik']
  spec.email                 = ['a.martinik@gmail.com']

  spec.summary               = 'Code generator for Czech post'
  spec.homepage              = 'https://github.com/14113/czech-post-code-generator'
  spec.license               = 'MIT'
  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
