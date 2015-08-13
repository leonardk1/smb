class CreateJoinTableOrderProduct < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order, :null => false
      t.references :product, :null => false
      t.integer    :quantity, :null => false

      t.timestamps
    end

    add_index(:order_products, [:order_id, :product_id, :quantity], :unique => true)
  end
end
