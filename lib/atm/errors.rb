# The best banging system on the world :)
module TheGlobalBankingSystem
  # will use when something goes wrong
  class Errors
    def type_error
      puts 'Access denied.'
    end

    def pin_is_invalid
      puts 'Access denied: incorrect PIN.'
    end

    def distable_card
      puts 'This card is distable'
      puts 'Contact with us to activate your card'
    end

    def block_the_card
      puts 'System will block the card.'
    end

    def no_money_account
      puts "You don't have enough money in your account."
    end

    def no_money_atm
      puts "We must apologise you because we don't have enough money in this ATM."
      puts 'You need to find another ATM or visit our bank.'
    end

    def operator_no_money_atm
      puts "Can't withdraw, not enough money in ATM"
    end

    def wrong_password
      puts 'Wrong password'
    end
  end
end
