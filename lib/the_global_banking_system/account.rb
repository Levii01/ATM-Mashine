# The best banking system on the world :)
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

    def display_balance
      log.info "Display balance. Ac: #{self}"
      puts "Balance: $#{balance}."
    end

    def withdraw(amount, atm)
      if balance >= amount
        if atm.enough_money_atm?(amount)
          atm.withdraw_money_atm(amount)
          self.balance -= amount
          puts "Withdrew #{amount}. New balance: $#{@balance}."
        else
          Errors.new.no_money_atm
          log.fatal "Can't withdraw, not enough money in ATM"
        end
      else
        Errors.new.no_money_account
        log.info "Can't withdraw, not enough money Ac: #{self}"
      end
    end

    def charge(amount, atm)
      user_charge_atm(amount, atm)
      self.balance += amount
      log.info "Charge account by card: #{card}, Ac: #{self}"
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    end

    private

    def user_charge_atm(money, atm)
      atm.charge_atm(money)
    end
  end
end
