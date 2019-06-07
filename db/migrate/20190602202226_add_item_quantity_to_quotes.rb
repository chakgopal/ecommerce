class AddItemQuantityToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :item_quantity, :integer, default: 1
  end
end
