import random
import string

class Robot(object):

    names = {}

    def __init__(self, name = None):
        self.name = None
        self.reset()

    def reset(self):
        self.name = self.generate_name()
        Robot.names[self.name] = self.name

    def generate_name(self):
        letters = ''.join(random.choice(string.ascii_uppercase) for i in range(2))
        numbers = ''.join(str(random.randint(0,9)) for i in range(3))
        new_name = letters + numbers
        return new_name if not Robot.names.get(new_name, False) else self.generate_name()
