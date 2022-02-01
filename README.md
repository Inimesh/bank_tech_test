# Bank Tech-test Challenge

This challenge entails writing a TTD program that can be interacted with using a REPL (such as irb)

The program facilitates deposit and withdrawal transactions, account statement printouts and local storage of the account balance.

Language - Ruby
Testing framework - rspec

---
## Configuration
To install dependencies by running the following in the parent directory:
`bundle install`

---
## Usage
Start irb and load the file by running in parent directory:
`irb -r ./lib/account.rb`

Create a new account:
```ruby
account = Account.new(initial_balance)
```

To deposit an amount:
```ruby
account.deposit(amount)
```

To withdraw an amount:
```ruby
account.withdraw(amount)
```

To view the current balance
```ruby
account.print_balance
```

To print a formatted statement
```ruby
account.print_statement
```

---
## Testing
To run rspec tests  and view coverage, simply enter `rspec` into the terminal.