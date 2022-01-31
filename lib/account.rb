class Account
  def initialize(init_balance=0)
    @records = []
    @balance = 0; deposit(init_balance)
  end

  # Commands
  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  # Queries
  def print_balance
    return @balance.to_s
  end

  def print_statement
    header = "date || credit || debit || balance\n"
    record_string = @records.reverse_each.map{ |record|
      record_to_string(record)
    }
    return header + record_string.join("\n")

  end

  private
  def gen_record(amount)
    record = {
      date: Time.now.strftime("%d/%m/%Y"),
      credit: nil,
      debit: nil,
      balance: @balance
    }
    amount > 0 ? record[credit] = amount : record[debit] = amount

    @records.append(record)
  end

end