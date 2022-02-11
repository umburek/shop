class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def purchase
    @purchase ||= Purchase.find_or_create_by(token: @token) do |purchase|
      purchase.sub_total = 0
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    purchase_item = purchase.items.find_or_initialize_by(
      product_id: product_id
    )

    purchase_item.price = product.price
    purchase_item.quantity = quantity

    purchase_item.save
  end

  def remove_item(id:)
    purchase.items.destroy(id)
  end
end