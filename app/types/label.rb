class Label < ::ActiveRecord::Type::String
  def serialize(value)
    value.to_s.upcase
  end
end
