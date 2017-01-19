# The best banking system on the world :)
module TheGlobalBankingSystem
  # control money in ATM
  class AtmCashCase < MyLog
    attr_accessor :money, :access

    def initialize
      @money = 4000
      @access = false
    end

    def log_in_atm
      if access
        puts 'Access ATM: enabled.'
      else
        check_password
      end
    end

    def log_out_atm
      lock_atm if access
    end

    def display_balance
      log.info 'Display balance ATM'
      puts "Balance: $#{money}."
    end

    def charge_atm(amount)
      log.info "Money has been charged to ATM, amount: #{amount},total #{money}"
      puts "Money has been charged to ATM, amount: #{amount}" if access
      self.money += amount
    end

    def withdraw_money_atm(amount)
      if enough_money_atm?(amount)
        self.money -= amount
        log.info "Money has been withdraw from ATM, amount: #{amount},total #{money}"
        puts "Money has been withdraw from ATM, amount: #{amount}" if access
      else
        Errors.new.operator_no_money_atm if access
        log.fatal "Can't withdraw, not enough money in ATM" if access
      end
    end

    def enough_money_atm?(value)
      self.money >= value
    end

    private

    def check_password
      log.warn 'Try to log in as operator..'
      puts "Secret password? (It's not 'secret123')."
      print 'Password: '
      password = gets.chomp
      password == 'secret123' ? unlock_atm : Errors.new.wrong_password
    end

    def unlock_atm
      self.access = true
      puts 'You are logged in.'
      log.warn 'Success log in as operator.'
    end

    def lock_atm
      self.access = false
      puts 'You are logged out.'
      log.warn 'Log out operator.'
    end
  end
end
