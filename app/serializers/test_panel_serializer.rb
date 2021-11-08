class TestPanelSerializer < BaseSerializer
  private

  def attributes
    {
      price: object.price,
      sample_tube_types: object.sample_tube_types,
      sample_volume_requirement: object.sample_volume_requirement
    }
  end

  def relationships
    {
      test: {
        data: object.tests_data.map { |data| BaseSerializer.new(data).as_json }
      }
    }
  end
end
