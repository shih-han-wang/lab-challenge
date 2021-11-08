class TestPanel
  include ActiveModel::Model

  class NotFoundError < StandardError; end

  DATA = [
    {
      id: 'TP1',
      tests: %w[CHO VITD],
      price: 1700
    },
    {
      id: 'TP2',
      tests: %w[HBA1C B12],
      price: 2100
    },
    {
      id: 'TP3',
      tests: %w[LFT VITD CHO],
      price: 1800
    }
  ]

  attr_accessor :id, :tests, :price
  attr_reader :tests_data

  def initialize(attribute = {})
    super
    @tests_data = tests.map { |id| Test.find_by_id(id) }
  end

  def sample_tube_types
    tests_data.map(&:sample_tube_type)
  end

  def sample_volume_requirement
    tests_data.sum(&:sample_volume_requirement)
  end

  def self.find_by_id(id)
    panel = DATA.find { |panel| panel[:id] === id.upcase }

    raise NotFoundError unless panel

    new(**panel)
  end
end
