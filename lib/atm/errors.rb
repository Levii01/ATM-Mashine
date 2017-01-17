# The best banging system on the world :)
module TheGlobalBankingSystem
  # will use when something goes wrong
  class Errors
    def type_error
      puts "Access denied."
    end

    def pin_is_invalid
      puts "Access denied: incorrect PIN."
    end

    def no_money_account
      puts "You don't have enough money in your account."
    end

    def no_money_bank
      puts "We must apologise you because we don't have enough money in this ATM."
      puts "You need to find another ATM or visit our bank."
    end
  end
end
