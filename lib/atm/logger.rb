# The best banging system on the world :)
module TheGlobalBankingSystem
  # operation on your account
  class MyLog
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
