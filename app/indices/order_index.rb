ThinkingSphinx::Index.define :order, :with => :active_record do
  # fields
  indexes id

  has restaurant_id
end