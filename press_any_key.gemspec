# -*- encoding: utf-8 -*-
# Waiting...

Gem::Specification.new do |gem|
  gem.name        = 'press_any_key'
  gem.version     = '1.0.0'
  gem.platform    = Gem::Platform::RUBY
  gem.license     = 'MIT'
  gem.author      = 'Tim Uruski'
  gem.email       = 'nerd@timuruski.net'
  gem.date        = '2014-11-17'
  gem.summary     = 'A tiny helper for waiting on user input.'
  gem.description = 'You can use PressAnyKey to halt a program until the user presses any key.'
  gem.homepage    = 'https://rubygems.org/gems/press_any_key'

  gem.files       = ['lib/press_any_key.rb']
  gem.test_files  = gem.files.grep(/spec\//)

  gem.add_development_dependency 'rspec', '~> 3.0'
end
