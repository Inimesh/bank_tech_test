require 'record'

describe Record do
  describe '#generate_record' do
    it 'should generate a transaction record and append it to its store' do
      record = Record.new
      expect(record.generate_record).to change(record, :@store.length).by(1)
    end
  end 
end