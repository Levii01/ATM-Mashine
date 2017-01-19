# The best banging system on the world :)
module TheGlobalBankingSystem
  # start session for new user
  class Session
    attr_accessor :account, :card
    attr_reader :atm

    def initialize
      @atm = TheGlobalBankingSystem::AtmCashCase.new
      @account = TheGlobalBankingSystem::Account.new('Milosz', 'Sedziak', 500)
      @card = account.new_card(5555)
    end

    def account_start
      system 'clear'
      puts 'Insert pin:'
      pin = gets.chomp
      card.log_in(pin.to_i)

      account_option if full_access
    end

    def operator
      system 'clear'
      atm.log_in_atm
      operator_option if atm.access
    end

    private

    def account_option
      puts 'Insert option number'
      puts '1. Charge account'
      puts '2. Withdraw money'
      puts '3. Show balance'
      puts '4. Owner information'
      puts '5. Log out'
      print 'Select: '
      begin
        case gets.chomp.to_i
        when 1 then add_money
        when 2 then withdraw
        when 3 then account.display_balance
        when 4 then card.owner
        when 5 then card.log_out
        else invalid_input
        end
      end
    end

    def operator_option
      puts ''
      puts 'Insert option number'
      puts 'ATM operator options:'
      puts '1. Add money to ATM'
      puts '2. Withdraw money from ATM'
      puts '3. Show ATM balance'
      puts '4. Active user card'
      print 'Select: '

      begin
        case gets.chomp.to_i
        when 1 then atm_add_money
        when 2 then atm_withdraw
        when 3 then atm.display_balance
        when 4 then card.activate_card
        else invalid_input
        end
      end
    end

    def add_money
      puts ''
      puts '1. Charge account:'
      puts 'How much money you want to charge?'
      print 'Amount: '
      add_amount = gets.chomp
      account.charge(add_amount.to_i, atm)
      puts ''
    end

    def withdraw
      puts ''
      puts '2. Withdraw money:'
      puts 'How much money you want to withdraw?'
      print 'Amount: '
      remove_amount = gets.chomp
      account.withdraw(remove_amount.to_i, atm)
      puts ''
    end

    def invalid_input
      puts 'Somethings gone wrong'
      puts 'Pleasery again!'
    end

    def atm_add_money
      puts ''
      puts '1. Add money to ATM:'
      puts 'How much money you want to charge?'
      print 'Amount: '
      add_amount_atm = gets.chomp
      atm.charge_atm(add_amount_atm.to_i)
      puts ''
    end

    def atm_withdraw
      puts ''
      puts '2. Withdraw money from ATM:'
      puts 'How much money you want to withdraw?'
      print 'Amount: '
      remove_amount_atm = gets.chomp
      atm.withdraw_atm(remove_amount_atm.to_i)
      puts ''
    end

    def full_access
      card.authentication && card.endable
    end
  end
end
