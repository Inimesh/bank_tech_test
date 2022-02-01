require 'record.rb'

class Account
  def initialize(init_balance=0, record_obj=Record.new)
    @record = record_obj
    @balance = 0.00; deposit(init_balance) if init_balance != 0
  end

  # Commands
  def deposit(amount)
    @balance += amount
    @record.generate_record(amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @record.generate_record(-amount, @balance)
  end

  # Queries
  def print_balance(typesetter_class=Typesetter)
    print typesetter_class.balance(@balance)
  end

  def print_statement(typesetter_class=Typesetter)
    print typesetter_class.statement(@record.store)
  end

end