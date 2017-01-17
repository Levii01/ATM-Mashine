# The best banging system on the world :)
module TheGlobalBankingSystem
  # card will use to veryficate owner of the account
  class Card
    attr_accessor :pin, :authentication, :endable
    attr_reader :account

    def initialize(pin, account)
      @pin = pin
      @account = account
      @authentication = false
      @endable = true
    end

    def log_in(insert_pin)
      puts 'log in...'
      if pin == insert_pin
        self.authentication = true
      else
        Errors.new.pin_is_invalid
      end
    end

    def log_out
      puts 'log out...'
      self.authentication = false
    end

    def owner
      puts "Account: #{account}"
      puts "Name: #{account.name}"
      puts "Surname: #{account.surname}"
      print 'Pin: '
      puts authentication ? pin : 'first you must log in'
    end

    # def your_card
    #   puts "hello dere"
    #   puts account
    #   # binding.pry
    # end
  end
end
