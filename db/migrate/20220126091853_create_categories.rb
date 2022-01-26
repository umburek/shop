class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.text :description

      t.timestamps
    end
    add_belongs_to :products, :category
    add_index :categories, :name
  end
end
