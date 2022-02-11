class ChangePurchaseProductsTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :purchase_products, :purchase_items
  end
end
