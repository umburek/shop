class CreateCategoryProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :category_product do |t|
      t.references :category, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
