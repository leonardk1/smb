class AddBusinessAttributes < ActiveRecord::Migration
  def change
    add_column :businesses, :name,     :string
    add_column :businesses, :address,  :string
    add_column :businesses, :location, :string
    add_column :businesses, :voice,    :string
    add_column :businesses, :fax,      :string
    add_column :businesses, :vrn,      :string
    add_column :businesses, :tin,      :string
  end
end
