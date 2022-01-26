class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :products, id: :uuid, null: false, default: 'gen_random_uuid()' do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :archived, default: false
      t.integer :on_stock

      t.timestamps
    end
  end
end
