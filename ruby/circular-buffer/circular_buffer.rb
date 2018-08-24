class CircularBuffer
  def initialize(length)
    @buffer = Array.new(length) {{data: nil}}
    @read, @write = 0, 0
  end

  def read
    raise BufferEmptyException if buffer_empty?
    data = @buffer[@read][:data]
    @read += 1 and return data
  end

  def write(data)
    write_to_buffer(data) { raise BufferFullException }
  end

  def write!(data)
    write_to_buffer(data) { @buffer.insert(-1, @buffer.delete_at(0)) }
  end

  def clear
    @buffer = Array.new(@buffer.length) {{data: nil}}
    @read, @write = 0, 0
  end

  private
    def buffer_empty?
      @read == @buffer.length || @buffer[@read][:data].nil?
    end

    def buffer_full?
      @buffer.last[:data]
    end

    def write_to_buffer(data)
      yield if buffer_full?
      @buffer[@write][:data] = data
      increment_write and return data
    end

    def increment_write
      @write += 1 unless buffer_full?
    end

    class BufferEmptyException < StandardError; end
    class BufferFullException < StandardError; end
end
