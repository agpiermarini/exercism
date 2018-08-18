class Nucleotide
  def self.from_dna(strand)
    Dna.new.set_histogram(strand)
  end
end

class Dna
  attr_reader :histogram
  def initialize
    @histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
  end

  def count(nucleotide)
    @histogram[nucleotide]
  end

  def set_histogram(strand)
    begin
      strand.split('').each { | nuc | @histogram[nuc] += 1 }
    rescue NoMethodError
      raise ArgumentError.new("Invalid DNA strand")
    end
    self
  end
end
