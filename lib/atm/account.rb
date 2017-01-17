# The best banging system on the world :)
module TheGlobalBankingSystem
  # operation on your account
  class Account
    attr_accessor :name, :surname, :balance

    def initialize(name, surname, balance)
      @name = name
      @surname = surname
      @balance = balance
    end

    def account_card(pin)
      card = Card.new(pin, self)
    end

    def display_balance
      # puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
      puts "Balance: $#{@balance}."
      # if something gone wrong.. Error
      # Errors.new.type_error
      # Errors.new.pin_is_invalid
      # Errors.new.no_money_bank
      # Errors.new.no_money_account
    end

    def withdraw(amount)
      # if pin_number == pin
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
      # else
      #   puts pin_error
      # end
    end

    def charge(amount)
      @balance += amount
    end
  end
end
