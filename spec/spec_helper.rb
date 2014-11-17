$LOAD_PATH.unshift File.expand_path('../lib')

require 'rspec'

RSpec.configure do |conf|
  conf.color = true
  conf.formatter = 'documentation'
  conf.order = 'random'
end
