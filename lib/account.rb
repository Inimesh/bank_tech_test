class Account
  def initialize(init_balance=0)
    @balance = init_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
  
  def print_balance
    return @balance.to_s
  end

  private

end