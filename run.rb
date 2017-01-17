require './lib/atm'
my_account = TheGlobalBankingSystem::Account.new('Milosz', 'Sedziak', 500)
my_account.display_balance
puts '================================'
my_card = my_account.account_card(5555)
my_card.owner
puts '================================'
set = gets.chomp
my_card.log_in(set.to_i)

puts '================================'
my_card.owner
puts '================================'
my_card.log_out

puts '================================'
my_card.owner
puts '================================'
# binding.pry
