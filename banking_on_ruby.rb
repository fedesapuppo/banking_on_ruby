class Account 
attr_reader :name
attr_reader :balance
  def initialize (name, balance=100)
    @name = name
    @balance = balance
  end

  private
  def pin
    @pin = 1234
  end

  def pin_error
    "Access denied: incorrect PIN."
  end

  public
  def display_balance(pin_number)
    if pin_number == pin 
      puts "Balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  def withdraw(pin_number, amount)
    if pin_number == pin && amount <= @balance
      @balance -= amount
      puts "Withdrew $#{amount}. New balance: $#{@balance}"
    elsif pin_number == pin && amount >= @balance
    puts "Not enough funds, please enter a lower amount to withdraw. Current balance: $#{@balance}"
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Deposited $#{amount}. New balance: $#{@balance}"
    else 
      puts pin_error
    end
  end
end

class SavingsAccount < Account
  def withdraw(pin_number, amount)
    if amount > 200
      puts "You can only withdraw a maximum of 200, please enter a lower amount"
    elsif pin_number == pin
      @balance -= amount
      puts "Withdrew $#{amount}. New balance: $#{@balance}"
    else 
      puts pin_error
    end
  end
end

#TEST

checking_account = Account.new("fede_nacion", 30000)
checking_account.display_balance(1234)
checking_account.withdraw(1234, 10000)
checking_account.deposit(1234, 25000)
checking_account.withdraw(1234, 46000)
checking_account.withdraw(1234, 30000)

savings_account = SavingsAccount.new("fede_galicia", 50000)

savings_account.display_balance(1234)
savings_account.withdraw(1234, 10000)
savings_account.withdraw(1234, 200)
savings_account.deposit(1234, 25000)
savings_account.withdraw(1234, 200)
savings_account.withdraw(1235, 200)
savings_account.withdraw(1234, 200)
