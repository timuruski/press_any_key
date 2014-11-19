require 'io/console'

class PressAnyKey
  MESSAGE = 'Press any key to continue...'
  CTRL_C = "\u0003"

  def initialize(console: nil,  message: MESSAGE)
    with(console) do |console_rd, console_wr|
      console_wr.puts message
      key = console_rd.getch
      raise Interrupt if key == CTRL_C
    end
  end

  private

  def with(console)
    console_rd, console_wr = parse_console(console)
    yield(console_rd, console_wr)
  rescue
    warn "Couldn't connect to TTY!"
    warn $!
    warn $!.backtrace
  end

  def parse_console(console)
    return console if console.kind_of?(Array) && console.count == 2
    return [console, console] unless console.nil?

    if $stdin.tty? && $stdout.tty?
      console_rd = $stdin
      console_wr = $stdout
    else
      console_rd = console_wr = IO.console
    end

    [console_rd, console_wr]
  end
end

if $0 == __FILE__
  puts "Starting..."
  PressAnyKey.new
  puts "...done!"
end
