require 'record'

describe Record do
  describe '#generate_record' do
    it 'should generate a transaction record and append it to its store attribute' do
      expect { subject.generate_record(100, 1100) }.to change { subject.store.length }.by(1)
    end

    it 'should return false and not generate a record when the amount of money in the transaction is 0' do
      expect(subject.generate_record(0, 1000)).to eq(false)
      expect { subject.generate_record(0, 1000) }.to_not change { subject.store.length }
    end
  end 
end