
require 'account'
require 'record'

describe Account do

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

end