class Gigasecond
  def self.from(birth)
    birth + 1_000_000_000
  end
end

module BookKeeping
  VERSION = 6
end
