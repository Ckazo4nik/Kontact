class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items, dependent: :destroy
  belongs_to :restaurant
  belongs_to :user
  before_validation :set_order_status
  after_save ThinkingSphinx::RealTime.callback_for(:order)

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  private
  def set_order_status
    self.order_status_id = OrderStatus.all.first.id
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
