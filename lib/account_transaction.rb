class AccountTransaction
  attr_reader :amount, :date, :type

  def initialize(amount, date = Time.new)
    verify_amount(amount)
    @date = date
    transaction_type
  end

private

  def transaction_type
    @amount > 0 ? @transaction_type = :deposit : @transaction_type = :withdrawl
  end

  def verify_amount(amount)
    raise_error "Money cannot be 0" if amount == 0
    @amount = amount
  end

end
