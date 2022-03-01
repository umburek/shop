class ShoppingCart

  delegate :sub_total, to: :purchase

  def initialize(token:, user_id:)
    @token = token
    @user_id = user_id
  end

  def purchase
    @purchase ||= Purchase.find_or_create_by(token: @token, user_id: @user_id, status: 'cart') do |purchase|
      purchase.sub_total = 0
    end
  end

  def items_count
    purchase.items.sum(:quantity)
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    purchase_item = purchase.items.find_or_initialize_by(product_id: product_id)
    purchase_item.price = product.price
    purchase_item.quantity = quantity

    ActiveRecord::Base.transaction do
      product.update(on_stock: product.on_stock - purchase_item.quantity)
      purchase_item.save
      update_sub_total!
    end
  end

  def remove_item(id:)
    purchase_item = purchase.items.find(id)
    product = purchase_item.product

    ActiveRecord::Base.transaction do
      product.update(on_stock: product.on_stock + purchase_item.quantity)

      purchase.items.destroy(id)
      update_sub_total!
    end
  end

  private

  def update_sub_total!
    purchase.sub_total = purchase.items.sum('quantity * price')
    purchase.save
  end
end