class HighScores(object):
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def highest(self):
        return max(self.scores)

    def top(self):
        return sorted(self.scores, reverse=True)[0:3]

    def report(self):
        latest_score, highest_score = self.latest(), self.highest()
        if latest_score == highest_score:
            return "Your latest score was %s. That's your personal best!" %(latest_score)
        else:
            return "Your latest score was %s. That's %s short of your personal best!" %(latest_score, highest_score - latest_score)
