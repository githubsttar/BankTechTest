require 'account_transaction'
require 'Timecop'

describe AccountTransaction do
  before do
    @time = Time.local(2019, 1, 16)
    Timecop.freeze(@time)
  end

  subject(:deposit) { described_class.new(100, @time) }
  subject(:withdrawl) { described_class.new(-100, @time) }

  describe '#initialize' do
    it 'adds this amount' do
      expect(deposit.amount).to eq(100)
    end

    it 'removes this amount' do
      expect(withdrawl.amount).to eq(-100)
    end
  end
end
