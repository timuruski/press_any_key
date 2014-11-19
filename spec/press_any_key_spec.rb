require 'spec_helper'
require 'ruby_block'
require 'press_any_key'

RSpec.describe PressAnyKey do
  # This breaks the console!
  xit 'waits with a default message' do
    test = RubyBlock.new do
      PressAnyKey.new
      puts 'Bye!'
    end

    test.read_write(/Press any key/, :space)
    test.run

    expect(test.output).to match('Press any key to continue...')
    expect(test.output).to match('Bye!')
  end

  it 'displays a custom message'
  it 'attaches to an arbitrary console'
  it 'resumes on any key'
  it 'handles ctrl-c sensibly'
  it 'can time out'
end
