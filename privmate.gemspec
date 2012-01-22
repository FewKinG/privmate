# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "privmate/version"

Gem::Specification.new do |s|
  s.name        = "privmate"
  s.version     = Privmate::VERSION
  s.authors     = ["Sven C."]
  s.email       = ["fewking@paniccrew.de"]
  s.homepage    = ""
  s.summary     = %q{Manage privacy settings and keep users informed on privacy issues}
  s.description = %q{This gem allows you to implement a privmate button that keeps track of what happens with the user's data. It also allows the user to adjust the privacy settings.}

  s.rubyforge_project = "privmate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
