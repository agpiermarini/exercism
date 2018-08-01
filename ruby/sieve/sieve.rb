class Sieve
  def initialize(ceiling)
    @ceiling = ceiling
  end

  def primes(values = (2..ceiling).to_a, index = 0)
    return values if values.empty? || values[index] ** 2 > values[-1]
    primes(remove_multiples(values, index), index += 1)
  end

  private
    attr_reader :ceiling

    def remove_multiples(values, index)
      values.select { | val | val == values[index] || val % values[index] != 0 }
    end
end


module BookKeeping
  VERSION = 1
end
