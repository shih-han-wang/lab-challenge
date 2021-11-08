class Test
  include ActiveModel::Model

  class NotFoundError < StandardError; end

  DATA = [
    {
      id: 'CHO',
      name: 'Cholesterol',
      sample_volume_requirement: 100,
      sample_tube_type: :yellow
    },
    {
      id: 'LFT',
      name: 'Liver function',
      sample_volume_requirement: 60,
      sample_tube_type: :yellow
    },
    {
      id: 'VITD',
      name: 'Vitamin D',
      sample_volume_requirement: 120,
      sample_tube_type: :yellow
    },
    {
      id: 'B12',
      name: 'Vitamin B12',
      sample_volume_requirement: 180,
      sample_tube_type: :yellow
    },
    {
      id: 'HBA1C',
      name: 'HbA1C',
      sample_volume_requirement: 40,
      sample_tube_type: :purple
    },
    {
      id: 'FBC',
      name: 'Full blood count',
      sample_volume_requirement: 80,
      sample_tube_type: :purple
    }
  ]

  attr_accessor :id, :name, :sample_volume_requirement, :sample_tube_type

  def self.find_by_id(id)
    test_data = DATA.find { |data| data[:id] === id.upcase }

    raise NotFoundError unless test_data

    new(**test_data)
  end
end
