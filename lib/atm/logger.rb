require 'logger'
require 'date'
# The best banging system on the world :)
module TheGlobalBankingSystem
  # operation on your account
  class MyLog
    attr_accessor :logger

    def initialize
      @logger = nil
    end

    def log
      if logger.nil?
        self.logger = Logger.new('log.txt')
        self.logger.level = Logger::DEBUG
        self.logger.datetime_format = '%Y-%m-%d %H:%M:%S '
      end
      self.logger
    end
  end
end
