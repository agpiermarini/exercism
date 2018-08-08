class SpaceAge
  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    seconds/ORBITAL_PERIODS_SECONDS[:earth]
  end

  def on_mercury
    seconds/ORBITAL_PERIODS_SECONDS[:mercury]
  end

  def on_venus
    seconds/ORBITAL_PERIODS_SECONDS[:venus]
  end

  def on_mars
    seconds/ORBITAL_PERIODS_SECONDS[:mars]
  end

  def on_jupiter
    seconds/ORBITAL_PERIODS_SECONDS[:jupiter]
  end

  def on_saturn
    seconds/ORBITAL_PERIODS_SECONDS[:saturn]
  end

  def on_uranus
    seconds/ORBITAL_PERIODS_SECONDS[:uranus]
  end

  def on_neptune
    seconds/ORBITAL_PERIODS_SECONDS[:neptune]
  end

  private
    attr_reader :seconds
end


ORBITAL_PERIODS_SECONDS = {
                            earth: 31_557_600.to_f,
                            mercury: 31_557_600 * 0.2408467.to_f,
                            venus: 31_557_600 * 0.61519726.to_f,
                            mars: 31_557_600 * 1.8808158.to_f,
                            jupiter: 31_557_600 * 11.862615.to_f,
                            saturn: 31_557_600 * 29.447498.to_f,
                            uranus: 31_557_600 * 84.016846.to_f,
                            neptune: 31_557_600 * 164.79132.to_f
                          }

module BookKeeping
  VERSION = 1
end
