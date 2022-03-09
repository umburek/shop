class AddAasmStateToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :aasm_state, :string
  end
end
