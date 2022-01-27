class CreateNewTableProducts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :products do |t|
      t.string :uuid, null: false, default: 'gen_random_uuid()'
      t.string :name, null: false
      t.text :description
      t.boolean :archived, default: false
      t.integer :on_stock, null: false, default: 0

      t.timestamps
    end
  end
end
