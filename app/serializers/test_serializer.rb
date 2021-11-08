class TestSerializer < BaseSerializer
  private

  def attributes
    {
      name: object.name,
      sample_volume_requirement: object.sample_tube_type,
      sample_tube_type: object.sample_volume_requirement
    }
  end
end
