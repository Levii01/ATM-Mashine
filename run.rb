require './lib/atm'
# log = Logger.new('log.txt')
# log.level = Logger::DEBUG
atm = TheGlobalBankingSystem::AtmCashCase.new

account = TheGlobalBankingSystem::Account.new('Milosz', 'Sedziak', 500)
account.display_balance
puts '================================'
card = account.new_card(5)
card.owner
puts '================================'
set = gets.chomp
card.log_in(set.to_i)

puts '================================'
card.owner
puts '================================'
card.log_out

puts '================================'
card.owner
puts '================================'
system 'clear'
puts atm

# log.debug 'hello'
# log.error 'world'
# log.info 'damn'
# log.warn 'you'
# log.fatal 'are'
binding.pry
