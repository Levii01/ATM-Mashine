require './lib/atm'
log= TheGlobalBankingSystem::MyLog.new
# log = Logger.new('log.txt')
# log.level = Logger::DEBUG

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
atm = TheGlobalBankingSystem::AtmCashCase.new
puts atm

log.log.debug 'still working'
# log.log.error 'world'
# log.log.info 'damn'
# log.log.warn 'you'
# log.log.fatal 'are'
binding.pry
