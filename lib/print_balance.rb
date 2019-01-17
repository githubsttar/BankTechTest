class PrintBalance

  def initialize
  end

  def print_balance(balance_log)
    @balance_log = balance_log
    puts title + print
  end

  private

  def title
    date = "date".ljust(10)
    credit = "credit".ljust(8)
    debit = "debit".ljust(8)
    balance = "balance\n"
    column = " || "

    date + column + credit + column + debit + column + balance
  end

  def account_balance
    @transactions = []
    @balance_log.transactions.each do |tr, balance|
      @transactions << "#{date(tr)} || #{make_deposit(tr)} || #{make_withdrawal(tr)} || #{sprintf('%.2f', balance)}"
    end
  end

  def print
    account_balance
    @transactions.map { |tr| "#{tr}" }.join("\n")
  end

  def date(tr)
    tr.date.strftime("%d/%m/%Y").ljust(10)
  end

  def make_deposit(tr)
    str = ""
    tr.type == :deposit ? "#{sprintf('%.2f', tr.amount)} " : str.ljust(8)
  end

  def make_withdrawal(tr)
    str = ""
    tr.type == :withdrawal ? "#{sprintf('%.2f', -tr.amount)} " : str.ljust(8)
  end

end
