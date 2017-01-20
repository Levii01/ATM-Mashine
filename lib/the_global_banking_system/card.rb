# The best banking system on the world :)
module TheGlobalBankingSystem
  # card will use to veryficate owner of the account
  class Card < MyLog
    attr_accessor :pin, :authentication, :enabled
    attr_reader :account

    def initialize(pin, account)
      @pin = pin
      @account = account
      @authentication = false
      @enabled = true
    end

    def log_in(inserted_pin)
      if enabled
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
      puts "Insert a special password: (It's not 'secret')"
      print 'Password: '
      special = gets.chomp
      unlock if special == 'secret'
      puts "\nCard #{self}"
      puts 'was activated!'
    end

    def owner
      puts "Account: #{account}"
      puts "Name: #{account.name}"
      puts "Surname: #{account.surname}"
      print 'Pin: '
      puts authentication ? pin : 'first you must log in'
      puts "Active card: #{enabled}"
    end

    private

    def lock
      self.enabled = false
      log.warn "Distable card: #{account.name} #{account.surname}, account : #{account}"
    end

    def unlock
      self.enabled = true
      log.warn "enabled card: #{account.name} #{account.surname}, account : #{account}"
    end

    def log_in_verification(inserted)
      puts 'log in...'
      if pin == inserted
        self.authentication = true
        log.info "Log in: #{account.name} #{account.surname}, account : #{account}"
        puts 'Correct! You are logged in.'
      else
        log.warn "Log in fail: wrong pin, distable card #{self} for account :#{account}"
        Errors.new.pin_is_invalid
        Errors.new.block_the_card
        lock
      end
    end

    def log_out_verification
      puts ''
      puts 'log out...'
      log.info "Log out: #{account.name} #{account.surname}, account : #{account}"
      self.authentication = false
    end
  end
end
