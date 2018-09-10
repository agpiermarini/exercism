import threading

class BankAccount(object):
    def __init__(self):
        self.balance = 0
        self.active = None
        self.lock = threading.RLock()

    def get_balance(self):
        self.checkAccountStatus()
        return self.balance

    def open(self):
        self.active = True

    def deposit(self, amount):
        self.checkAccountStatus()
        if amount < 0:
            raise ValueError()
        else:
            with self.lock:
                self.balance += amount

    def withdraw(self, amount):
        self.checkAccountStatus()
        if amount < 0 or amount > self.balance:
            raise ValueError()
        else:
            with self.lock:
                self.balance -= amount

    def close(self):
        self.active = False

    def checkAccountStatus(self):
        if self.active == False or self.active == None:
            raise ValueError()
