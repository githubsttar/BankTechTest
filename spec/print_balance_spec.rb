require 'print_balance'

describe PrintBalance do
  before do
    @deposit_time = Time.local(2019, 1, 16)
    Timecop.freeze(@deposit_time)
    @withdrawal_time = Time.local(2019, 1, 16)
    Timecop.freeze(@withdrawal_time)
  end

  let(:deposit) {double(:transaction, amount: 1000, date: @deposit_time, type: :deposit)}
  let(:withdrawal) {double(:transaction, amount: -2000, date: @withdrawal_time, type: :withdrawal)}
  let(:balance_log) {instance_double("BalanceLog")}
  subject(:account_balance) {described_class.new}

  describe '#print_balance' do
    it 'prints out the statement with header' do
      allow(balance_log).to receive(:transactions){{deposit => 1000, withdrawal => 800}}
      print_out = "date       || credit   || debit    || balance\n16/01/2019 || 1000.00  ||          || 1000.00\n16/01/2019 ||          || 2000.00  || 800.00"
      expect(STDOUT).to receive(:puts).with(print_out)
      account_balance.print_balance(balance_log)
    end
  end
end
