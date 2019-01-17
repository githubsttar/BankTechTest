require 'balance_log'
require 'account_transaction'

describe BalanceLog do
  let(:account_transaction) { double :account_transaction }
  let(:transaction_class) { double(:transaction_class, new: account_transaction) }
  subject(:log) {described_class.new(transaction_class)}

  before do
    allow(account_transaction).to receive(:amount){10}
    allow(account_transaction).to receive(:balance){1000}
  end

  describe '#history' do
    it 'starts with an empty array of transactions' do
      expect(log.transactions).to be_empty
    end

    it 'keeps a record of transactions' do
      log.create(10, 1000)
      expect(log.transactions.keys[0].amount).to eq(10)
    end

    it 'has the current balance' do
      log.create(10, 1000)
      expect(log.transactions.values[0]).to eq(1000)
    end
  end

    describe '#create' do
      it 'makes a transaction' do
        log.create(10, 1000)
        expect(log.transactions).to include(account_transaction)
      end
    end
end
