class OrderItem < ApplicationRecord
  belongs_to :dish
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :order_present
  after_commit ThinkingSphinx::RealTime.callback_for(:order)
  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      dish.price
    end
  end

  def total_price
    unit_price * quantity
  end


  def self.create_for_order(order, items_params)
    items_params.each do |item|
      dish = Dish.find(item["id"])
      OrderItem.create(
                    dish_id: dish.id,
                    order_id: order.id,
                    quantity: item["quantity"]
      )
    end

  end

  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
