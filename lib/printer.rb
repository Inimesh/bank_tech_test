class Printer

  def self.print_statement
    header = "date || credit || debit || balance\n"
    record_string = @records.reverse_each.map{ |record|
      record_to_string(record)
    }
    return header + record_string.join("\n")
  end

  def self.print_balance
    return display_format(@balance)
  end

  private

  def self.format_display(amount)
    return "%.2f" % amount
  end

  def self.record_to_string(record)
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

end