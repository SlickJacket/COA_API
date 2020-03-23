class AddReadToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :read, :boolean
  end
end
