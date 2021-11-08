require 'rails_helper'

describe TestPanel, type: :model do
  it 'should store the data in a DATA constant' do
    expect(TestPanel::DATA.length > 0).to eq true
  end
  describe 'class methods' do
    context 'find_by_id' do
      context 'when insance is found' do
        let(:test_panel) { TestPanel::DATA.first }
        let(:id) { test_panel[:id] }

        it 'should return instance with correct id' do
          expect(described_class.find_by_id(id).id).to eq id
        end
      end

      context 'when insance is not found' do
        let(:id) { 'TPTEST' }

        it 'should return instance with correct id' do
          expect { described_class.find_by_id(id) }.to raise_error(TestPanel::NotFoundError)
        end
      end
    end
  end

  describe 'instance methods' do
    let(:test_panel) { TestPanel.new(**TestPanel::DATA.first) }

    context 'sample_tube_types' do
      it 'should return correct sample tube types' do
        expect(test_panel.sample_tube_types).to eq %i[yellow yellow]
      end
    end

    context 'sample_volume_requirement' do
      it 'should return correct sample volume requirement' do
        expect(test_panel.sample_volume_requirement).to eq 220
      end
    end
  end
end
