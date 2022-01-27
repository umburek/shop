class ChangeUidCategoriesColumnValue < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :uid
    enable_extension 'pgcrypto'
    add_column :categories, :uid, :uuid, null: false, default: 'gen_random_uuid()'
  end
end
