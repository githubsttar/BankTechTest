require 'account'

describe Account do
  STARTING_BALANCE = Account::STARTING_BALANCE
  subject(:new_account) { described_class.new }

  describe '#initialize' do
    it 'a new account with the start balance of 0' do
      expect(new_account.balance).to eq(STARTING_BALANCE)
    end
  end

  describe '#money_in' do
    it 'adds money to the account' do
      new_account.money_in(1000)
      expect(new_account.balance).to eq(1000)
    end
  end

  describe '#money_out' do
    before {new_account.money_in(2000)}

    it 'subtracts money from the account' do
      new_account.money_out(1000)
      expect(new_account.balance).to eq(1000)
    end
  end

  describe '#current_statement' do
    it 'prints out the current balance' do
      new_account.money_in(2000)
      expect(new_account.current_statement).to eq(2000) 
    end
  end
end
