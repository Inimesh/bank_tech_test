require 'printer'

describe Printer do
  describe '.statement' do
    it 'returns a full statement as a string' do
      # TODO Turn this Time mocking into feature test
      # account = Account.new
      # allow(Time).to receive(:now).and_return(Time.new(2023, 1, 10))
      # account.deposit(1000)
      # allow(Time).to receive(:now).and_return(Time.new(2023, 1, 13))
      # account.deposit(2000)
      # allow(Time).to receive(:now).and_return(Time.new(2023, 1, 14))
      # account.withdraw(500)

      expect(account.statement).to eq(
        <<~HEREDOC.chomp
        date || credit || debit || balance
        14/01/2023 || || 500.00 || 2500.00
        13/01/2023 || 2000.00 || || 3000.00
        10/01/2023 || 1000.00 || || 1000.00
        HEREDOC
      )
    end
  end

  describe '.balance' do
    it 'should display the current balance to 2 decimal places' do
      account = Account.new(100)
      expect(account.balance).to eq('100.00') 
    end
  end
  
end