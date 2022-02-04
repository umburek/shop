class ChangeCategoryProductTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :category_product, :category_products
  end
end
