# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-personal"
  s.version     = "0.0.1" 
  s.authors     = ["bdoooh"]
  s.email       = ["brendan@brendanlogic.com"]
  s.homepage    = "http://brendanlogic.com"
  s.summary     = %q{A Brendan Do Plugin}
  s.description = %q{This is a Plugin for developed for Brendan Do}

  s.rubyforge_project = "siriproxy-personal"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
   s.add_runtime_dependency "net-ssh"
end
