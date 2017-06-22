# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commention/version'

Gem::Specification.new do |spec|
  spec.name          = "commention"
  spec.version       = Commention::VERSION
  spec.authors       = ["at-huynguyen2"]
  spec.email         = ["huy.nguyen2@asiantech.vn"]

  spec.summary       = "Create standard for funtions"
  spec.description   = "Create standard for funtions"
  spec.license       = "MIT"
  spec.executables << "commention"
  spec.add_runtime_dependency('byebug', '9.0.6')
end
