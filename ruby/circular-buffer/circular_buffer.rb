class CircularBuffer
  def initialize(length)
    @buffer = Array.new(length) {{data: nil}}
    @read, @write = 0, 0
  end

  def read
    begin
      if @buffer[@read][:data]
        data = @buffer[@read][:data]
        @read += 1 and return data
      else
        raise BufferEmptyException
      end
    rescue NoMethodError
      raise BufferEmptyException
    end
  end

  def write(data)
    if @buffer[@write][:data].nil?
      @buffer[@write][:data] = data
      increment_write and return data
    else
      raise BufferFullException
    end
  end

  def write!(data)
    return write(data) unless buffer_full?
    @buffer[0][:data] = data
    @buffer.insert(-1, @buffer.delete_at(0)) and return data
  end

  def clear
    @buffer.each { | element | element[:data] = nil }
    @read, @write = 0, 0
  end

  private
    def buffer_full?
      @buffer.last[:data]
    end

    def increment_write
      @write += 1 unless buffer_full?
    end

    class BufferEmptyException < StandardError; end
    class BufferFullException < StandardError; end
end
