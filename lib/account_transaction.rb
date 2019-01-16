class AccountTransaction

  attr_reader :balance

  def initialize(transaction_log = TransactionLog.new, balance = DEFAULT_BALANCE)
    @balance = balance
    @transaction_log = transaction_log
  end

  def deposit(amount)
    @balance += amount
    @transaction_log.create(amount, balance)
  end

  def withdrawl
    @balance -= amount
    @transaction_log.create(-amount, balance)
  end

  private

  def current_balance
    @balance
  end

end
