# The best banging system on the world :)
module TheGlobalBankingSystem
  # operation on your account
  class Account
    attr_accessor :card, :name, :surname, :balance

    def initialize(name, surname, balance)
      @name = name
      @surname = surname
      @balance = balance
      @card = nil
    end

    def new_card(pin)
      self.card = Card.new(pin, self)
    end

    def full_access
      card.authentication && card.endable
    end

    def display_balance
      puts "Balance: $#{balance}."
    end

    def withdraw(amount)
      check_withdraw(amount)
    end

    def check_withdraw(cash)
      if balance >= cash
        self.balance -= cash
        puts "Withdrew #{cash}. New balance: $#{@balance}."
      else
        Errors.new.no_money_account
      end
    end

    def charge(amount)
      self.balance += amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    end
  end
end
