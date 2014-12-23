Gem::Specification.new do |s|
  s.name        = 'skeevy'
  s.version     = '0.0.1'
  s.date        = '2014-12-19'
  s.summary     = "Skeevy"
  s.description = "A simple key-value store for objects"
  s.authors     = ["Craig Waterman"]
  s.email       = 'craigwaterman@gmail.com'
  s.homepage    =
      'http://rubygems.org/gems/skeevy'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec',   '~> 3.1'
end