ThinkingSphinx::Index.define :restaurant, :with => :active_record do
  # fields
  indexes name , :sortable => true
  set_property :min_prefix_len => 1

  has user_id
end