class TestPanel
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

  def self.find_by_id(id)
    DATA.find { |panel| panel[:id] === id.upcase }
  end
end
