class ProductAttributes < ActiveRecord::Migration
  def change
    add_column :products, :name,       :string
    add_column :products, :unit_price, :float
    add_column :products, :description, :text
  end
end
