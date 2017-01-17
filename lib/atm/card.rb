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

    def log_in(inserted_pin)
      if endable
        login_verification(inserted_pin)
      else
        Errors.new.distable_card
      end
    end

    def login_verification(inserted)
      puts 'log in...'
      if pin == inserted
        self.authentication = true
      else
        Errors.new.pin_is_invalid
        Errors.new.block_the_card
        lock
      end
    end

    def log_out
      puts 'log out...'
      self.authentication = false
    end

    def activate_card
      print 'Insert a special password: '
      special = gets.chomp
      unlock if special == 'secret'
    end

    def owner
      puts "Account: #{account}"
      puts "Name: #{account.name}"
      puts "Surname: #{account.surname}"
      print 'Pin: '
      puts authentication ? pin : 'first you must log in'
      puts "Active card: #{endable}"
    end

    private

    def lock
      self.endable = false
    end

    def unlock
      self.endable = true
    end
  end
end
