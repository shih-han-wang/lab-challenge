class BaseSerializer
  def initialize(object)
    @object = object
  end

  def as_json
    {
      type: object.class.name.underscore,
      id: object.id,
      attributes: attributes,
      relationships: relationships
    }.compact_blank
  end

  private

  attr_reader :object

  def attributes
    {}
  end

  def relationships
    {}
  end
end
