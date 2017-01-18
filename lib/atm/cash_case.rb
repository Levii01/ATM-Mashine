# The best banging system on the world :)
module TheGlobalBankingSystem
  # control money in ATM
  class AtmCashCase
    attr_accessor :money, :access

    def initialize
      @money = 4000
      @access = false
    end

    def log_in_atm
      if access
        puts 'Access ATM: endable'
      else
        check_password
      end
    end

    def check_password
      puts "Secret password? (It's not 'secret123')"
      print 'Pw: '
      password = gets.chomp
      password == 'secret123' ? unlock_atm : Errors.new.wrong_password
    end

    def log_out_atm
      lock_atm
    end

    def charge_atm(amount)
      self.money += amount
    end

    def withdraw_atm(amount)
      check_atm_withdraw(amount)
    end

    def check_atm_withdraw(cash)
      if money >= cash
        self.money -= cash
      else
        Errors.new.no_money_atm
      end
    end

    private

    def unlock_atm
      self.access = true
      puts 'You are logged in'
    end

    def lock_atm
      self.access = false
      puts 'You are logged out'
    end
  end
end
