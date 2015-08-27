class AddBusinessIdToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :business_id, :integer
  end
end
