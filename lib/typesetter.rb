# The function of this class is to convert data into printable strings
class Typesetter

  def self.statement(record)
    header = "date || credit || debit || balance\n"
    record_string = record.reverse_each.map { |transaction|
      transaction_to_string(transaction)
    }
    return header + record_string.join("\n")
  end

  def self.balance(balance)
    return format_display(balance)
  end

  private_class_method def self.format_display(amount)
    return "%.2f" % amount
  end

  private_class_method def self.transaction_to_string(transaction)
    date_token = "#{transaction[:date]} "
    credit_token = transaction[:credit] ? " #{format_display(transaction[:credit])} " : " "
    debit_token = transaction[:debit] ? " #{format_display(transaction[:debit])} " : " "
    balance_token = " #{format_display(transaction[:balance])}"

    return [
      date_token,
      credit_token,
      debit_token,
      balance_token
    ].join("||")
  end

end