ThinkingSphinx::Index.define :dish, :with => :active_record do
  # fields
  indexes name , :sortable => true
  set_property :min_prefix_len => 1

  has restaurant_id
end