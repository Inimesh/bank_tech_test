# The function of this class is to convert data into printable strings
class Typesetter

  def self.statement(account)
    header = "date || credit || debit || balance\n"
    record_string = account.record.store.reverse_each.map{ |transaction|
      transaction_to_string(transaction)
    }
    return header + record_string.join("\n")
  end

  def self.balance(balance)
    return format_display(balance)
  end

  private

  def self.format_display(amount)
    return "%.2f" % amount
  end

  def self.transaction_to_string(transaction)
    date_token = "#{transaction[:date]} "
    credit_token = transaction[:credit] ? " #{display_format(transaction[:credit])} " : " "
    debit_token = transaction[:debit] ? " #{display_format(transaction[:debit])} " : " "
    balance_token = " #{display_format(transaction[:balance])}"

    return [
      date_token,
      credit_token,
      debit_token,
      balance_token
    ].join("||")
  end

end