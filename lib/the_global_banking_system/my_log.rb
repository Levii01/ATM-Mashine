# The best banking system on the world :)
# require 'singleton'
module TheGlobalBankingSystem
  # operation on your account
  class MyLog
    # include Singleton
    attr_accessor :logger

    @logger = nil
    def log
      if logger.nil?
        self.logger = Logger.new('log.txt')
        logger.level = Logger::DEBUG
        logger.datetime_format = '%Y-%m-%d %H:%M:%S '
      end
      logger
    end
  end
end
