
require 'account'

describe Account do
  describe '#print_balance' do
    it 'should display the current balance' do
      account = Account.new(100)
      expect(account.print_balance).to eq('100') 
    end
  end

  describe '#deposit' do
    it 'should add the specified amount to the balance' do
      account = Account
      account.deposit(120)
      expect(account.print_balance).to eq('120')
    end
  end


end