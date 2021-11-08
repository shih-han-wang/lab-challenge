require 'rails_helper'

describe Test, type: :model do
  it 'should store the data in a DATA constant' do
    expect(Test::DATA.length > 0).to eq true
  end

  describe 'class methods' do
    context 'when insance is found' do
      let(:test_model) { Test::DATA.first }
      let(:id) { test_model[:id] }

      it 'should return instance with correct id' do
        expect(described_class.find_by_id(id).id).to eq id
      end
    end

    context 'when insance is not found' do
      let(:id) { 'TESTID' }

      it 'should return instance with correct id' do
        expect { described_class.find_by_id(id) }.to raise_error(Test::NotFoundError)
      end
    end
  end
end
