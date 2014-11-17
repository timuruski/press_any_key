require 'io/console'

class PressAnyKey
  MESSAGE = 'Press any key to continue...'
  def initialize(console: nil, message: MESSAGE)
    console ||= File.open('/dev/tty', 'w+')
    console.puts message
    console.raw { |io| io.readchar rescue nil }
  rescue
    warn "Couldn't connect to console!"
  end
end

if $0 == __FILE__
  puts "Starting..."
  PressAnyKey.new(message: 'Wait for it...')
  puts "...done!"
end
