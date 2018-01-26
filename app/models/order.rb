class Order < ApplicationRecord
  include RubySimpleSearch
  belongs_to :order_status
  has_many :order_items, dependent: :delete_all, foreign_key: 'order_id'
  belongs_to :restaurant
  belongs_to :user
  before_validation :set_order_status
  after_commit ThinkingSphinx::RealTime.callback_for(:order)
  simple_search_attributes :ids

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  private
  def set_order_status
    self.order_status_id ||= OrderStatus.all.first.id
  end
  def update_subtotal
    self[:subtotal] = subtotal
  end

end
