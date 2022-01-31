class Account
  def initialize(init_balance=0)
    @records = []
    @balance = 0.00; deposit(init_balance) if init_balance != 0
  end

  # Commands
  def deposit(amount)
    @balance += amount
    gen_record(amount)
  end

  def withdraw(amount)
    @balance -= amount
    gen_record(-amount)
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
    amount > 0 ? record[:credit] = amount : record[:debit] = -amount

    @records.append(record)
  end

  def record_to_string(record)
    return "#{record[:date]} || #{record[:credit]} || #{record[:debit]} || #{record[:balance]}"
  end

end