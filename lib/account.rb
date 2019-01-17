class Account
  attr_reader :balance

  STARTING_BALANCE = 0

  def initialize(balance_log = BalanceLog.new, balance = STARTING_BALANCE)
    @balance = balance
    @balance_log = balance_log
  end

  def money_in(amount)
    @balance += amount
    @balance_log.create(amount, balance)
  end

  def money_out(amount)
    @balance -= amount
    @balance_log.create(-amount, balance)
  end

  def current_statement
    @balance
  end

end
