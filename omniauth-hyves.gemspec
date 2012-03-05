# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth/hyves/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-hyves"
  s.version     = Omniauth::Hyves::VERSION
  s.authors     = ["Mark Kremer"]
  s.email       = ["mark@socialreferral.com"]
  s.summary     = %q{Hyves strategy for OmniAuth}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0.1'
  s.add_runtime_dependency 'multi_xml', '~> 0.4.1'
end
