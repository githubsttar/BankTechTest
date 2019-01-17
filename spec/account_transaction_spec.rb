require 'account_transaction'
require 'Timecop'

describe AccountTransaction do
  before do
    @time = Time.local(2019, 1, 16)
    Timecop.freeze(@time)
  end

  subject(:deposit) { described_class.new(100, @time) }
  subject(:withdrawal) { described_class.new(-100, @time) }

  describe '#initialize' do
    it 'adds this amount' do
      expect(deposit.amount).to eq(100)
    end

    it 'transaction includes time' do
      expect(deposit.date).to eq(@time)
    end
  end

  describe 'type' do
    it 'is a deposit if greater than 0' do
      expect(deposit.type).to eq(:deposit)
    end

    it 'is a withdrawal if less than 0' do
      expect(withdrawal.type).to eq(:withdrawal)
    end
  end
end
