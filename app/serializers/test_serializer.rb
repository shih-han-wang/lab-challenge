class TestSerializer < BaseSerializer
  private

  def attributes
    {
      name: object.name,
      sample_volume_requirement: object.sample_volume_requirement,
      sample_tube_type: object.sample_tube_type
    }
  end
end
