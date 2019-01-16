require 'account_transaction'

describe AccountTransaction do
  before do
    @time = Time.local(2019, 1, 16)
    Timecop.freeze(@time)
  end

  subject(:money_in) {described_class.new(100, @time)}
  subject(:money_out) {described_class.new(-100, @time)}

  describe '#initialize' do
    it 'adds this amount' do
      expect(credit.amount).to eq(10)
    end


  end

end
