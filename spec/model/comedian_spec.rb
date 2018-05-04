RSpec.describe Comedian do
  describe 'create comedian' do
    it 'should create a valid comedian' do
      comedian = Comedian.create(name: "Iliza Shlesinger", age: 34)
      expect(comedian).to be_valid
      expect(Comedian.count).to eq(1)
    end
  end
end
