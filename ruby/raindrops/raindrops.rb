class Raindrops
  def self.convert(number)
    sounds = {3 => "Pling", 5 => "Plang", 7 => "Plong"}
    result = sounds.map { | key, sound | number % key == 0 ? sound : nil }.join
    result.empty? ? (return number.to_s) : result
  end
end

module BookKeeping
  VERSION = 3
end
