class AddStatusToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :status, :string, default: 'cart'

    Purchase.where(status: nil).update_all(status: 'cart')
  end
end
