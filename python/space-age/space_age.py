class SpaceAge(object):
    def __init__(self, seconds):
        self.seconds = seconds

    def on_mercury(self):
        return round(self.seconds/self.orbitalPeriodSeconds("mercury"), 2)

    def on_mercury(self):
        return round(self.seconds/self.orbitalPeriodSeconds("mercury"), 2)

    def on_venus(self):
        return round(self.seconds/self.orbitalPeriodSeconds("venus"), 2)

    def on_earth(self):
        return round(self.seconds/self.orbitalPeriodSeconds("earth"), 2)

    def on_mars(self):
        return round(self.seconds/self.orbitalPeriodSeconds("mars"), 2)

    def on_jupiter(self):
        return round(self.seconds/self.orbitalPeriodSeconds("jupiter"), 2)

    def on_saturn(self):
        return round(self.seconds/self.orbitalPeriodSeconds("saturn"), 2)

    def on_uranus(self):
        return round(self.seconds/self.orbitalPeriodSeconds("uranus"), 2)

    def on_neptune(self):
        return round(self.seconds/self.orbitalPeriodSeconds("neptune"), 2)

    def orbitalPeriodSeconds(self, key):
        orbitalPeriods = {
                            "earth": 31557600,
                            "mercury": 31557600 * 0.2408467,
                            "venus": 31557600 * 0.61519726,
                            "mars": 31557600 * 1.8808158,
                            "jupiter": 31557600 * 11.862615,
                            "saturn": 31557600 * 29.447498,
                            "uranus": 31557600 * 84.016846,
                            "neptune": 31557600 * 164.79132
                          }

        return orbitalPeriods[key]
