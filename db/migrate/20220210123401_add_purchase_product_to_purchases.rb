class AddPurchaseProductToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchase_products, :purchase, null: false, foreign_key: true
  end
end
