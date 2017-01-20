require './lib/atm'
log = TheGlobalBankingSystem::MyLog.new
log.log.debug 'still working'
session = TheGlobalBankingSystem::Session.new
loop do
  puts
  puts '================================'
  puts 'Welcomen.'
  puts 'Insert option number'
  puts '1. Insert card'
  puts ''
  puts ''
  puts '9630. Log in as operator'
  puts ''
  puts '================================'

  begin
    case gets.chomp.to_i
    when 1 then session.account_start
    when 9630 then session.operator
    else session.invalid_input
    end
  end
  session.atm.log_out_atm if session.atm.access
  session.card.log_out if session.card.authentication
  puts 'Godbay!'
end
