class Account
  def initialize(init_balance=0)
    @balance = init_balance
  end
  
  def print_balance
    return @balance.to_s
  end
end