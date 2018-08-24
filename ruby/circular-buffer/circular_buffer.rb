class CircularBuffer
  def initialize(length)
    @buffer = Array.new(length) {{read: nil, write: nil, data: nil}}
    @read = 0
    @write = 0
  end

  def read
    begin
      if @buffer[@read][:data]
        data = @buffer[@read][:data]
        @read += 1 and return data
      else
        @read = 0
        raise CircularBuffer::BufferEmptyException.new
      end
    rescue
      raise CircularBuffer::BufferEmptyException.new
    end
  end

  def write(data)
    if @buffer[@write][:data].nil?
      @buffer[@write][:data] = data
      @write += 1
    else
      raise CircularBuffer::BufferEmptyException.new
    end
  end

  class BufferEmptyException < StandardError; end
end
