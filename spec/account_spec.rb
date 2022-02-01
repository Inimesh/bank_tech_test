
require 'account'
require 'record'

describe Account do

  # TODO Maybe use this block to refactor tests to be more concise
  # before(:each) do
  #   record = instance_double("Record", generate_record: true)
  #   account = Account.new(0, record)
  # end

  describe '#deposit' do
    it 'should add the specified amount to the balance' do
      account = Account.new()
      account.deposit(120)
      expect { account.print_balance }.to output('120.00').to_stdout
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
      account = Account.new()
      account.withdraw(50)
      expect { account.print_balance }.to output('-50.00').to_stdout
    end

    it 'should call its instance of Record to generate a record' do
      record = instance_double("Record", generate_record: true)
      account = Account.new(0, record)
      expect(record).to receive(:generate_record)
      account.withdraw(50)
    end
  end

  describe '#print_statement' do
    it 'prints the account balance to stdout' do
      expect { subject.print_statement }.to output().to_stdout
    end
    
  end

end