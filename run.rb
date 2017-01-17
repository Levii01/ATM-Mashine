require './lib/atm'
my_account = TheGlobalBankingSystem::Account.new('Milosz', 'Sedziak', 500)
my_account.display_balance
puts '================================'
my_card = my_account.account_card(5555)
my_card.owner
puts '================================'
my_card.log_in(5555)

puts '================================'
my_account.account_card(5555)
my_card.owner
puts '================================'
my_card.log_out

puts '================================'
my_account.account_card(5555)
my_card.owner
puts '================================'
# binding.pry
