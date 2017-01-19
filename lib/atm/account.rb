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

    def display_balance
      log.info "Display balance. Ac: #{self}"
      puts "Balance: $#{balance}."
    end

    def withdraw(amount)
      if balance >= amount
        if TheGlobalBankingSystem::AtmCashCase.new.enough_atm?(amount)
          TheGlobalBankingSystem::AtmCashCase.new.withdraw_atm(amount)
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


    # def withdraw(amount)
      #if ac ?                 OK
        #if ATM
        # do it                TOOO
        # else
        # nie ma hajsu w banku OK
        # end
      # else
      # nie ma hajsu na koncie  OK
      # end
    # end


    # def withdraw(amount)
    #   log.info "Withdraw money... Ac: #{self}"
    #   check_withdraw(amount) &&
    # end
    #
    # def check_withdraw(cash)
    #   if balance >= cash
    #   else
    #     Errors.new.no_money_account
    #     log.fatal "Can't withdraw, not enough money Ac: #{self}"
    #   end
    # end
    #
    # def user_withdraw_atm(money)
    #   TheGlobalBankingSystem::AtmCashCase.new.withdraw_atm(money)
    # end
    #
    # def withdraw_money(cash)
    #   # account and bank
    #   self.balance -= cash
    #   puts "Withdrew #{cash}. New balance: $#{@balance}."
    # end

    def charge(amount)
      user_charge_atm(amount)
      self.balance += amount
      log.info "Charge account by card: #{card}, Ac: #{self}"
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    end

    def user_charge_atm(money)
      TheGlobalBankingSystem::AtmCashCase.new.charge_atm(money)
    end
    private

  end
end
# def full_access
#   card.authentication && card.endable
# end
