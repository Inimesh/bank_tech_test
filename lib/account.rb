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
  def balance
    return display_format(@balance)
  end

  def statement
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
    date_token = "#{record[:date]} "
    credit_token = record[:credit] ? " #{display_format(record[:credit])} " : " "
    debit_token = record[:debit] ? " #{display_format(record[:debit])} " : " "
    balance_token = " #{display_format(record[:balance])}"

    return [
      date_token,
      credit_token,
      debit_token,
      balance_token
    ].join("||")
  end

  def display_format(amount)
    return "%.2f" % amount
  end

end