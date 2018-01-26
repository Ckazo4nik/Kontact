ThinkingSphinx::Index.define :order, :with => :active_record do
  indexes id

  has restaurant_id
end