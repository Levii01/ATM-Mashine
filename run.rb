require './lib/atm'
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
binding.pry
