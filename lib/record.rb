# The function of this class is to generate and store records of transactions in an account
class Record
  attr_reader :store
  
  def initialize
    @store = []
  end

  def generate_record(amount, balance)
    if amount != 0
      record = {
        date: Time.now.strftime("%d/%m/%Y"),
        credit: nil,
        debit: nil,
        balance: balance
      }
      amount > 0 ? record[:credit] = amount : record[:debit] = -amount
      @store.append(record)
      return record
    end
    return false

  end
end