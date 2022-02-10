class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.decimal :sub_total, null: false, precision: 15, scale: 2

      t.timestamps
    end
  end
end
