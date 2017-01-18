# The best banging system on the world :)
module TheGlobalBankingSystem
  # operation on your account
  class Account < MyLog
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
      log.info "Display balance. Ac: #{self}"
      puts "Balance: $#{balance}."
    end

    def withdraw(amount)
      log.info "Withdraw money. Ac: #{self}"
      check_withdraw(amount)
    end

    def check_withdraw(cash)
      if balance >= cash
        self.balance -= cash
        puts "Withdrew #{cash}. New balance: $#{@balance}."
      else
        Errors.new.no_money_account
        log.fatal "Withdraw money > fail (no money), Ac: #{self}"
      end
    end

    def charge(amount)
      self.balance += amount
      log.info "Charge account by card: #{card}, Ac: #{self}"
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    end
  end
end
