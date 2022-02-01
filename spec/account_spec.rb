
require 'account'
require 'record'

describe Account do
  describe '#balance' do
    it 'should display the current balance to 2 decimal places' do
      account = Account.new(100)
      expect(account.balance).to eq('100.00') 
    end
  end

  # before(:each) do
  #   record = instance_double("Record", generate_record: true)
  #   account = Account.new(0, record)
  # end

  describe '#deposit' do
    it 'should add the specified amount to the balance' do
      record = instance_double("Record", generate_record: true)
      account = Account.new(0, record)
      account.deposit(120)
      expect(account.balance).to eq('120.00')
    end
    
    it 'should call its instance of Record to generate a record' do
      record = instance_double("Record", generate_record: true)
      account = Account.new(0, record)
      expect(record).to receive(:generate_record)
      account.deposit(120)
    end
  end
  
  describe '#withdraw' do
    it 'should deduct the specified amount from the balance' do
      record = instance_double("Record", generate_record: true)
      account = Account.new(0, record)
      account.withdraw(50)
      expect(account.balance).to eq('-50.00')
    end

    it 'should call its instance of Record to generate a record' do
      record = instance_double("Record", generate_record: true)
      account = Account.new(0, record)
      expect(record).to receive(:generate_record)
      account.withdraw(50)
    end
  end

  describe '#print_statement' do
    it 'returns a full statement as a string' do
      account = Account.new
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 10))
      account.deposit(1000)
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 13))
      account.deposit(2000)
      allow(Time).to receive(:now).and_return(Time.new(2023, 1, 14))
      account.withdraw(500)

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
end