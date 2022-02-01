require 'account'

describe 'Feature Test' do
  before(:all) do
    @account = Account.new
  end

  describe 'using the program to deposit/withdraw money and print out balance and a statement' do
    it 'should be able to deposit money and add it to my balance' do
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 10))
      @account.deposit(3000)
      expect { @account.print_balance }.to output('3000.00').to_stdout
    end

    it 'should be able to withdraw money and it be deducted from my balance' do
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 13))
      @account.withdraw(800)
      expect { @account.print_balance }.to output('2200.00').to_stdout
    end

    it 'should be able to print out a statement of all my transactions' do
      expect { @account.print_statement }.to output(
        <<~HEREDOC.chomp
        date || credit || debit || balance
        13/01/2023 || || 800.00 || 2200.00
        10/01/2023 || 3000.00 || || 3000.00
        HEREDOC
      ).to_stdout
    end
    
  end
end