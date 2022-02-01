require 'record'

describe Record do
  describe '#generate_record' do
    it 'should generate a transaction record and append it to its store attribute' do
      # TODO Check that Time.now is called
      expect { subject.generate_record(100, 1100) }.to change { subject.store.length }.by(1)
    end
  end 
end