class RubyBlock
  def initialize(&block)
    @test_block = &block
    @patterns = {}
  end

  attr_reader :output

  def run
    # sync_rd, @sync_wr = IO.pipe
    input_rd, input_wr = IO.pipe
    output_rd, output_wr = IO.pipe

    pid = fork do
      $stdin = input_rd
      $stdout = $stderr = output_wr
      @test_block.call(self)
    end

    # sync_rd.gets
    # output_wr.close

    # Capture output
    @output = ''
    # output_rd.readlines do |line|
    #   @output << line
    #   # response = find_response(line)
    #   # input_wr.write(response) unless response.nil?
    # end

    self
  ensure
    close_all(input_rd, input_wr, output_rd, output_wr)
  end

  def read_write(pattern, response)
    @patterns[pattern] = response
  end

  def find_response(line)
    _,response = @patterns.find { |pattern,_| pattern =~ line }

    case response
    when :space then ' '
    when :ctrl_c then "\u0003"
    else nil
    end
  end

  def close_all(*pipes)
    pipes.each do |pipe|
      pipe.close unless pipe.closed?
    end
  end
end

