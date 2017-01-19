# The best banging system on the world :)
module TheGlobalBankingSystem
  # card will use to veryficate owner of the account
  class Card < MyLog
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
        log_in_verification(inserted_pin)
      else
        log.info "Log in: card is distable, account :#{account}"
        Errors.new.distable_card
      end
    end

    def log_out
      log_out_verification if authentication
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
      log.warn "Distable card: #{account.name} #{account.surname}, account : #{account}"
    end

    def unlock
      self.endable = true
      log.warn "Endable card: #{account.name} #{account.surname}, account : #{account}"
    end

    def log_in_verification(inserted)
      puts 'log in...'
      if pin == inserted
        self.authentication = true
        log.info "Log in: #{account.name} #{account.surname}, account : #{account}"
      else
        log.warn "Log in fail: wrong pin, distable card #{self} for account :#{account}"
        Errors.new.pin_is_invalid
        Errors.new.block_the_card
        lock
      end
    end

    def log_out_verification
      puts 'log out...'
      log.info "Log out: #{account.name} #{account.surname}, account : #{account}"
      self.authentication = false
    end
  end
end
