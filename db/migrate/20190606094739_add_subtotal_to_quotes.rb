class AddSubtotalToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :subtotal, :integer
  end
end
