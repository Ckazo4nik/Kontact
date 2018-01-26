ThinkingSphinx::Index.define :order, :with => :active_record do
  indexes id

  has restaurant_id, order_status_id, user_id
end