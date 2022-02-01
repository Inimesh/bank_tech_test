class Record
  attr_reader :store
  
  def initialize
    @store = []
  end

  def generate_record(amount, balance)
    record = {
      date: Time.now.strftime("%d/%m/%Y"),
      credit: nil,
      debit: nil,
      balance: balance
    }
    amount > 0 ? record[:credit] = amount : record[:debit] = -amount
    @store.append(record)
  end

end