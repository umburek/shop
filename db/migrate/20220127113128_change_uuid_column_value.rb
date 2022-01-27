class ChangeUuidColumnValue < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :uuid
    enable_extension 'pgcrypto'
    add_column :products, :uuid, :uuid, null: false, default: 'gen_random_uuid()'
  end
end
